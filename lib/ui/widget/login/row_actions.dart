import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../model/app_state_manager.dart';
import '../../theme/theme.dart';
import '../btn_actions.dart';

/* Botones para las diferentes acciones en la aplicacion en la vista login */
class RowBtnActions extends StatelessWidget {
  const RowBtnActions({super.key});

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
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnSpeak,
          textColor: ThemeAKasa.btnBorderSpeak,
          textAction: "Leo por ti",
          icon: Icons.speaker,
          onAction: () => print("Leo por ti"),
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnHear,
          textColor: ThemeAKasa.btnBorderHear,
          textAction: getIconTxt(context),
          icon: getIconMic(context),
          onAction: () =>
              Provider.of<AppStateManager>(context, listen: false).toggleMic(),
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnPerfil,
          textColor: ThemeAKasa.btnBorderPerfil,
          textAction: "Perfil",
          icon: Icons.person,
          onAction: () => print("Perfil"),
        ),
      ],
    );
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
