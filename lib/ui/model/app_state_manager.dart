import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _micOn = false;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isMicOn => _micOn;

  /// It waits for 2 seconds and then sets the _initialized variable to true.
  /// This is just to simulate a loading screen.
  void initializeApp() {
    Timer(const Duration(milliseconds: 2000), () {
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
        toggleMicOnOff();
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
}
