import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../provider/app_state_manager.dart';

class Command {
  static const goTo = "ir a";
  static const createUser = "crear cuenta";
  static const login = "contraseña";
}

class SpeechApi {
  static final _spechText = stt.SpeechToText();

  static Future<bool> toggleRec({
    required Function(String txt, BuildContext context) onResult,
    required BuildContext context,
  }) async {
    final appState = Provider.of<AppStateManager>(context, listen: false);
    final isAvailable = await _spechText.initialize(
      onStatus: (val) {
        if (val == 'notListening') {
          appState.toggleMicOnOff();
          _spechText.stop();
          scanText(context);
        }
      },
      onError: (val) => print('onError: $val'),
    );

    if (isAvailable) {
      _spechText.listen(
          cancelOnError: true,
          onResult: (val) {
            onResult(val.recognizedWords, context);
            appState.setVozToText(val.recognizedWords);
          });
    }
    return isAvailable;
  }

  /// I'm trying to get the value of the text variable from the SpeechApi class and return it to the
  /// calling function
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget that calls the function.
  static Future listenToMe(BuildContext context) {
    final appState = Provider.of<AppStateManager>(context, listen: false);
    appState.toggleMic();
    final micOn = appState.isMicOn;
    String text = appState.vozToText;

    if (!micOn) {
      SpeechApi.toggleRec(
          context: context, onResult: (txt, context) => text = txt);
    }
    return Future.value(text);
    // return null;
  }

  static void scanText(BuildContext context) {
    final appState = Provider.of<AppStateManager>(context, listen: false);
    final text = appState.vozToText.toLowerCase();
    if (text.contains(Command.goTo)) {
      final page = text.split(Command.goTo)[1].trim();
      context.go('/$page');
      return;
    }
    if (text.contains(Command.login)) {
      appState.splitText();
    }
  }
}
