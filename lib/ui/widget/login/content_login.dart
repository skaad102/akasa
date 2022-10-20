import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/widget/form_log.dart';
import 'package:prueba_a_kasa/ui/widget/login/gesture_zone.dart';
import 'package:prueba_a_kasa/ui/widget/login/row_actions.dart';

class ContentLogin extends StatelessWidget {
  const ContentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
      child: Center(
          child: Column(
        children: [
          RowBtnActions(),
          ZonaGestos(),
          FormularioAkasa(textAction: 'Crea tu cuenta'),
        ],
      )),
    );
  }
}
