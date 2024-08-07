# eSewa Integration with Flutter

This guide explains how to integrate the eSewa Mobile SDK with your Flutter project. The eSewa Mobile SDK enables native Android applications to accept eSewa payments. The SDK supports only one use case for making payments – Single Payment (i.e., one payment per one user login).

## Instructions

1. Download the SDK from this [Drive link](https://drive.google.com/drive/folders/1k386YYPMPAtMQvLxopNFaYBufCdaHh4S).
2. Extract the zip file.
3. Copy the `esewa_flutter_sdk` folder to the root of your project.
4. Add the SDK path in `pubspec.yaml` dependencies as follows and run `flutter pub get` command in the terminal:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     esewa_flutter_sdk:
       path: ./esewa_flutter_sdk



## Configurations

To resolve theme issues, modify your Android Manifest file:

Navigate to android/app/src/main/AndroidManifest.xml and update the theme as follows:

```bash
  <application
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"
    ... >
    ...
</application>
```
    
## kotlin Compatibility
 Kotlin Version Compatibility
If you encounter issues related to having two different versions of Kotlin, ensure that the Kotlin version in the eSewa SDK matches your project's Kotlin version. Update the Kotlin version in the build.gradle files if necessary.

Example Error
If you encounter an error similar to the following:

![image](https://github.com/user-attachments/assets/e6b67423-3036-4260-8818-c02eee4427c9)

## Solution 

![image](https://github.com/user-attachments/assets/89fd1b31-5c84-49ac-bad5-7ffd28c592e3)
Here , I have the kotlin version of   flutter  sdk is 1.8.0  so i changed it to my project kotlin version of 1.7.0 . And the version mismatch is solved.