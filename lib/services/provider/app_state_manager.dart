import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _micOn = false;
  String _vozToText = "";
  String _telefono = "";
  String _pin = "";

  // late stt.SpeechToText _speech;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isMicOn => _micOn;
  String get vozToText => _vozToText;
  String get telefono => _telefono;
  String get pin => _pin;

  void setVozToText(String text) {
    //TODO : filtrar utilidades
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
    if (phone == "1111111111" && pin == "1111") {
      _loggedIn = true;
      notifyListeners();
      return;
    }
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

  /// A function that splits the text into two parts, the phone number and the pin.
  void splitText() {
    /* telefono 11223344 contraseña 1123 */
    List<String> wordsSpace = _vozToText.split(" ");
    /* [telefono, 11223344, contraseña, 1123 ] */

    /* telefono 311 558 25 95 contraseña 1123 */
    List<String> wordsWord = _vozToText.split("contraseña");
    /* [[telefono 311 558 25 95], [contraseña 1123]] */

    if (wordsSpace.length == 4) {
      wordsSpace.forEach((element) {
        element.trim().replaceAll(" ", "");
      });
      _telefono = wordsSpace[1];
      _pin = wordsSpace[3];
      notifyListeners();
      return;
    }

    if (wordsWord.length == 2) {
      // wordsWord.forEach((element) {
      //   element
      //       .trim()
      //       .replaceAll("telefono", "")
      //       .replaceAll("teléfono", "")
      //       .replaceAll(" ", "");
      // });
      _telefono = wordsWord[0]
          .trim()
          .replaceAll("telefono", "")
          .replaceAll("teléfono", "")
          .replaceAll(" ", "");
      _pin = wordsWord[1].trim().replaceAll(" ", "");
      notifyListeners();
      return;
    }

    /* return error */
  }
}

class ZonaGestosManager extends ChangeNotifier {
  late Timer _timerOn;
  bool _zoneGesture = false;
  bool get zoneGesture => _zoneGesture;
  Timer get timer => _timerOn;

  void timerCancel() {
    _timerOn.cancel();
    notifyListeners();
  }

  /// _timerOn is a timer that is set to 3500 milliseconds. When the timer is finished, _zoneGesture is
  /// set to false
  void changeZoneGesture() {
    _timerOn = Timer(
      const Duration(milliseconds: 3500),
      () {
        _zoneGesture = false;
      },
    );
    notifyListeners();
  }

  /// _timerOn is a Timer that waits 1200 milliseconds before setting _zoneGesture to true
  void changeZoneGestureOff() {
    _timerOn = Timer(
      const Duration(milliseconds: 1200),
      () {
        _zoneGesture = true;
      },
    );
    notifyListeners();
  }
}
