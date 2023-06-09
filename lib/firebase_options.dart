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
    apiKey: 'AIzaSyBVMW39y_STlMrjytuV2-Q4StN4xDFJXQg',
    appId: '1:481892389283:web:dc849d2c462dc21d234a16',
    messagingSenderId: '481892389283',
    projectId: 'learn-aid',
    authDomain: 'learn-aid.firebaseapp.com',
    storageBucket: 'learn-aid.appspot.com',
    measurementId: 'G-3N4MC8WTRL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkYkTOOirFnmqRLr4N_IBY1ctHDJQIY_I',
    appId: '1:481892389283:android:35e2c0ef39c48bd9234a16',
    messagingSenderId: '481892389283',
    projectId: 'learn-aid',
    storageBucket: 'learn-aid.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALEurcOPwgOkA-2q-XfDV0LlaNTDv5Tr0',
    appId: '1:481892389283:ios:6b13c4fab0e04726234a16',
    messagingSenderId: '481892389283',
    projectId: 'learn-aid',
    storageBucket: 'learn-aid.appspot.com',
    iosClientId: '481892389283-6rv5jbjqh398tpltem8lnn5is2o332nq.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnAid',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALEurcOPwgOkA-2q-XfDV0LlaNTDv5Tr0',
    appId: '1:481892389283:ios:6b13c4fab0e04726234a16',
    messagingSenderId: '481892389283',
    projectId: 'learn-aid',
    storageBucket: 'learn-aid.appspot.com',
    iosClientId: '481892389283-6rv5jbjqh398tpltem8lnn5is2o332nq.apps.googleusercontent.com',
    iosBundleId: 'com.example.learnAid',
  );
}
