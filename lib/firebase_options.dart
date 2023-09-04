// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYR6s5bry9k962ZpZIdr0LNvGSweQAV3U',
    appId: '1:473695277455:android:cf7f496d21e24f58143bfa',
    messagingSenderId: '473695277455',
    projectId: 'cryptotradex-7a0ce',
    storageBucket: 'cryptotradex-7a0ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkhe5rSZ7N18HFvS_PhU0bxqIzIB3xlr4',
    appId: '1:473695277455:ios:9df832ba5fc33089143bfa',
    messagingSenderId: '473695277455',
    projectId: 'cryptotradex-7a0ce',
    storageBucket: 'cryptotradex-7a0ce.appspot.com',
    iosClientId: '473695277455-ic1g0n2pttpsoe5pte689pp6f2hc0e5g.apps.googleusercontent.com',
    iosBundleId: 'com.example.cryptotradex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkhe5rSZ7N18HFvS_PhU0bxqIzIB3xlr4',
    appId: '1:473695277455:ios:be64646075b44fca143bfa',
    messagingSenderId: '473695277455',
    projectId: 'cryptotradex-7a0ce',
    storageBucket: 'cryptotradex-7a0ce.appspot.com',
    iosClientId: '473695277455-hco6bb6gnf446am6ehphf59h7ajk8sih.apps.googleusercontent.com',
    iosBundleId: 'com.example.cryptotradex.RunnerTests',
  );
}
