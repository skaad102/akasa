import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

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
          textAction: "Te Escucho",
          icon: Icons.mic,
          onAction: () async {
            final status = await Permission.microphone.request();
            switch (status) {
              case PermissionStatus.granted:
                print("Te Escucho");
                break;
              case PermissionStatus.denied:
              case PermissionStatus.permanentlyDenied:
              case PermissionStatus.restricted:
              case PermissionStatus.limited:
                openAppSettings();
            }
          },
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

  void permiso() {
    print("Permiso");
  }
}
