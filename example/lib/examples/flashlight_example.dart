import 'package:ar_flutter_plugin_flash/ar_flutter_plugin_flash.dart';
import 'package:ar_flutter_plugin_flash/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_flash/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_flash/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_flash/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_flash/managers/ar_session_manager.dart';
import 'package:flutter/material.dart';

class FlashlightExampleWidget extends StatefulWidget {
  const FlashlightExampleWidget({Key? key}) : super(key: key);

  @override
  _FlashlightExampleWidgetState createState() =>
      _FlashlightExampleWidgetState();
}

class _FlashlightExampleWidgetState extends State<FlashlightExampleWidget> {
  ARSessionManager? arSessionManager;
  ARObjectManager? arObjectManager;
  bool _isFlashOn = false;

  @override
  void dispose() {
    super.dispose();
    // Safety check: Ensure flashlight turns off when leaving the screen
    if (_isFlashOn) {
      arSessionManager?.toggleFlashlight(state: false);
    }
    arSessionManager?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Flashlight'),
      ),
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: FloatingActionButton.extended(
                onPressed: _toggleFlashlight,
                icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
                label: Text(_isFlashOn ? "Turn Flash Off" : "Turn Flash On"),
                backgroundColor: _isFlashOn ? Colors.orange : Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager!.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          showWorldOrigin: true,
        );
    this.arObjectManager!.onInitialize();
  }

  Future<void> _toggleFlashlight() async {
    if (arSessionManager != null) {
      bool newState = !_isFlashOn;
      // 🟢 Calls your newly added native bridge!
      bool success = await arSessionManager!.toggleFlashlight(state: newState);

      if (success) {
        setState(() {
          _isFlashOn = newState;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Flashlight is unavailable on this device.')),
        );
      }
    }
  }
}
