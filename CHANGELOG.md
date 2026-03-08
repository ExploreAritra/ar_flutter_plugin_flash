# Changelog

## 1.1.5

- **New Feature:** Added `updateVisibilityOptions` to dynamically toggle debug visualizations (`showFeaturePoints`, `showPlanes`, `showWorldOrigin`) on the fly without needing to re-initialize the AR session. This is critical for capturing clean, artifact-free snapshots.

## 1.1.4

- **Fix:** Resolved Swift-to-Objective-C bridging header import paths for iOS (`ar_flutter_plugin_flash-Swift.h`) to fix Xcode build failures.

## 1.1.3

- **New Feature:** Added native Flashlight / Torch support (`toggleFlashlight`) for both ARCore (Android) and ARKit (iOS) without interrupting the active AR tracking session.
- **Update:** Renamed package and repository to `ar_flutter_plugin_flash`.
- additional scaling options
- additional lighting options
- pre-caching of trackable images

## 1.1.2

- import fix

## 1.1.1

- bug fix

## 1.1.0

- Removed depricated Sceneform dependency on Android
- Introduced Filament dependency on Android
- !!! On Android there is currently a bug in the ARCore library which interfers with the tracking functionality. To achieve a smooth tracking the app must be build with "debuggable false" in build.gradle !!!

## 1.0.1

- Support 16kb page size

## 1.0.0

- Extended the original ar_flutter_plugin with image tracking.