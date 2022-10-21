import 'dart:async';

import 'package:flutter/cupertino.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;

  void initializeApp() {
    // 7
    Timer(
      const Duration(milliseconds: 2000),
      () {
        // 8
        _initialized = true;
        // 9
        notifyListeners();
      },
    );
  }

  void login(String phone, String pin) {
    // 10
    // _loggedIn = true;
    print({phone, pin});
    // 11
    notifyListeners();
  }

  void goTo(String ruta) {
    print('proxima pagina');
    // 12
    notifyListeners();
  }

  void logout() {
    // 12
    _loggedIn = false;
    _initialized = false;
    // 13
    initializeApp();
    // 14
    notifyListeners();
  }
}
