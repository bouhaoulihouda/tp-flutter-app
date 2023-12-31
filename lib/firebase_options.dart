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
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHdX2NMzEfBVNy9rBHuElJ-VTEi-XENvs',
    appId: '1:1071781606611:web:e18623f95d52c18c0c5026',
    messagingSenderId: '1071781606611',
    projectId: 'bouhaouli-houda',
    authDomain: 'bouhaouli-houda.firebaseapp.com',
    storageBucket: 'bouhaouli-houda.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5buPRcFdW9mlcrPjQcXEzeNJHP6wuUww',
    appId: '1:1071781606611:android:9ed8afd52d3e71720c5026',
    messagingSenderId: '1071781606611',
    projectId: 'bouhaouli-houda',
    storageBucket: 'bouhaouli-houda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsYlKZ0S6aWHyqvmQTFi6qKk9lE3LXPr4',
    appId: '1:1071781606611:ios:38d5f108bbd65d9f0c5026',
    messagingSenderId: '1071781606611',
    projectId: 'bouhaouli-houda',
    storageBucket: 'bouhaouli-houda.appspot.com',
    iosBundleId: 'com.example.houdaBouhaouli',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAsYlKZ0S6aWHyqvmQTFi6qKk9lE3LXPr4',
    appId: '1:1071781606611:ios:320b675315e9bff30c5026',
    messagingSenderId: '1071781606611',
    projectId: 'bouhaouli-houda',
    storageBucket: 'bouhaouli-houda.appspot.com',
    iosBundleId: 'com.example.houdaBouhaouli.RunnerTests',
  );
}
