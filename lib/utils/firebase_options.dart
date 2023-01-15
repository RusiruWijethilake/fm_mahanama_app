import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/*
* FirebaseOptions class
* This class contains the firebase options for each platform
* File was generated using the FlutterFire CLI
* Do not change any of these values
* Any PRs containing changes to this file will be rejected
 */

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBcunac6tUP6UgKb4z-USUXWoFtKm4KmXo',
    appId: '1:1023337101903:web:65cb956b2bdbeca837483a',
    messagingSenderId: '1023337101903',
    projectId: 'fm-mahanama-2017-live-stream',
    authDomain: 'fm-mahanama-2017-live-stream.firebaseapp.com',
    databaseURL: 'https://fm-mahanama-2017-live-stream.firebaseio.com',
    storageBucket: 'fm-mahanama-2017-live-stream.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEK7diFKSH5-q2yVlqLhfBgFNRRzPPztU',
    appId: '1:1023337101903:android:f90c0af3cb34bf2537483a',
    messagingSenderId: '1023337101903',
    projectId: 'fm-mahanama-2017-live-stream',
    databaseURL: 'https://fm-mahanama-2017-live-stream.firebaseio.com',
    storageBucket: 'fm-mahanama-2017-live-stream.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxtQyWjAW6U5-ztITihlaJYH4z3KI_r-0',
    appId: '1:1023337101903:ios:6a9480e5a3a18f8937483a',
    messagingSenderId: '1023337101903',
    projectId: 'fm-mahanama-2017-live-stream',
    databaseURL: 'https://fm-mahanama-2017-live-stream.firebaseio.com',
    storageBucket: 'fm-mahanama-2017-live-stream.appspot.com',
    androidClientId: '1023337101903-01dngqutq50pqvfs1h87903grur5kd1s.apps.googleusercontent.com',
    iosClientId: '1023337101903-paha4ehk5ug2l498n4muuhqf9o7sd53d.apps.googleusercontent.com',
    iosBundleId: 'com.lk.rusiruwijethilake.fmMahanamaApp',
  );
}
