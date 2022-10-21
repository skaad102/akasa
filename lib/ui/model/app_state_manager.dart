import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _micOn = false;
  String _vozToText = "";

  late stt.SpeechToText _speech;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isMicOn => _micOn;
  String get vozToText => _vozToText;

  void setVozToText(String text) {
    _vozToText = text;
    notifyListeners();
  }

  /// It waits for 2 seconds and then sets the _initialized variable to true.
  /// This is just to simulate a loading screen.
  void initializeApp() {
    Timer(const Duration(milliseconds: 2500), () {
      _initialized = true;
      notifyListeners();
    });
  }

  /// It takes two strings, prints them, and then notifies all listeners that the state has changed
  ///
  /// Args:
  ///   phone (String): The phone number of the user
  ///   pin (String): The user's pin
  void login(String phone, String pin) {
    print({phone, pin});
    notifyListeners();
  }

  /// The function sets the _loggedIn variable to false, sets the _initialized variable to false, sets the
  /// _micOn variable to false, calls the initializeApp() function, and then calls the notifyListeners()
  /// function
  void logout() {
    _loggedIn = false;
    _initialized = false;
    _micOn = false;
    initializeApp();
    notifyListeners();
  }

  /// If the user has granted the microphone permission, toggle the microphone on/off. If the user has
  /// denied the microphone permission, open the app settings
  void toggleMic() async {
    final status = await Permission.microphone.request();
    switch (status) {
      case PermissionStatus.granted:
        // _speech = stt.SpeechToText();
        toggleMicOnOff();
        // _listen();
        break;
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        openAppSettings();
    }
  }

  void toggleMicOnOff() {
    _micOn = !_micOn;
    notifyListeners();
  }

//   void _listen() async {
//     String _lastWords = "";
//     if (_micOn) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         _speech.listen(
//           cancelOnError: true,
//           onResult: (val) => () {
//             _lastWords = val.recognizedWords;
//             print({val, val.recognizedWords});
//           },
//         );
//       }
//     } else {
//       _speech.stop();
//     }
//   }
}
