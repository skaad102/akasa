import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/services/SpeechApi/speech_api.dart';

import '../../../services/provider/app_state_manager.dart';
import '../../theme/theme.dart';
import '../btn_actions.dart';

/* Botones para las diferentes acciones en la aplicacion en la vista login */
class RowBtnActions extends StatefulWidget {
  const RowBtnActions({super.key});

  @override
  State<RowBtnActions> createState() => _RowBtnActionsState();
}

class _RowBtnActionsState extends State<RowBtnActions> {
  @override
  Widget build(BuildContext context) {
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
          // onAction: () => listenToMe(appState.isMicOn, context),
          onAction: () => SpeechApi.listenToMe(context),
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

  IconData getIconMic(BuildContext context) {
    final microOn = Provider.of<AppStateManager>(context).isMicOn;
    return microOn ? Icons.mic : Icons.mic_off;
  }

  String getIconTxt(BuildContext context) {
    final microOn = Provider.of<AppStateManager>(context).isMicOn;
    if (!microOn) return "Te Escucho";
    return "No Escuchar";
  }
}
