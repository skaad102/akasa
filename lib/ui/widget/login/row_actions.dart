import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../model/app_state_manager.dart';
import '../../theme/theme.dart';
import '../btn_actions.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

/* Botones para las diferentes acciones en la aplicacion en la vista login */
class RowBtnActions extends StatefulWidget {
  const RowBtnActions({super.key});

  @override
  State<RowBtnActions> createState() => _RowBtnActionsState();
}

class _RowBtnActionsState extends State<RowBtnActions> {
  var _spechText = stt.SpeechToText();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _spechText = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateManager>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BtnAction(
          backgroundColor: ThemeAKasa.btnBack,
          textColor: ThemeAKasa.btnBorderBack,
          textAction: "Atrás",
          icon: Icons.play_arrow_rounded,
          onAction: () => context.go('/'),
          msSemantic: "",
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnSpeak,
          textColor: ThemeAKasa.btnBorderSpeak,
          textAction: "Leo por ti",
          icon: Icons.speaker,
          onAction: () => print("Leo por ti"),
          msSemantic: "",
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnHear,
          textColor: ThemeAKasa.btnBorderHear,
          textAction: getIconTxt(context),
          icon: getIconMic(context),
          onAction: () => listenToMe(appState.isMicOn, context),
          msSemantic:
              "Dí telefono seguido de tu número, posteriormente dí contraseña seguido de tu pin",
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnPerfil,
          textColor: ThemeAKasa.btnBorderPerfil,
          textAction: "Perfil",
          icon: Icons.person,
          onAction: () => print("Perfil"),
          msSemantic: "",
        ),
      ],
    );
  }

  void listenToMe(bool micOn, BuildContext context) async {
    final appState = Provider.of<AppStateManager>(context, listen: false);
    appState.toggleMic();
    final micOn = appState.isMicOn;
    String text = appState.vozToText;
    if (!micOn) {
      bool available = await _spechText.initialize(
        // onStatus: (val) => print('onStatus: $val'),
        onStatus: (val) {
          setState(() {
            if (val == 'notListening' || val == 'done') {
              appState.toggleMic();
            }
          });
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        _spechText.listen(
          cancelOnError: true,
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            appState.setVozToText(text);
          }),
        );
      }
    } else {
      _spechText.stop();
      // text = "";
      appState.splitText();
    }
  }

  IconData getIconMic(BuildContext context) {
    final microOn = Provider.of<AppStateManager>(context).isMicOn;
    if (microOn) return Icons.mic;
    return Icons.mic_off;
  }

  String getIconTxt(BuildContext context) {
    final microOn = Provider.of<AppStateManager>(context).isMicOn;
    if (!microOn) return "Te Escucho";
    return "No Escuchar";
  }

  void permiso() {
    print("Permiso");
  }
}
