import 'package:flutter/material.dart';

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
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnSpeak,
          textColor: ThemeAKasa.btnBorderSpeak,
          textAction: "Leo por ti",
          icon: Icons.speaker,
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnHear,
          textColor: ThemeAKasa.btnBorderHear,
          textAction: "Te Escucho",
          icon: Icons.mic,
        ),
        BtnAction(
          backgroundColor: ThemeAKasa.btnPerfil,
          textColor: ThemeAKasa.btnBorderPerfil,
          textAction: "Perfil",
          icon: Icons.person,
        ),
      ],
    );
  }
}
