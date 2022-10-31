import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

import '../../model/app_state_manager.dart';

class ZonaGestos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zonaManager = Provider.of<ZonaGestosManager>(context);
    final zonaOnOff = zonaManager.zoneGesture;
    return GestureDetector(
      // /* activar o desactivar zona de gestos */
      // onPanStart: (_) => zonaManager.timerCancel(),
      // onPanUpdate: (details) => {
      //   if (details.delta.direction == 0 && zonaOnOff)
      //     {
      //       print("Derecha"),
      //     }
      //   else if (details.delta.direction > 1 && zonaOnOff)
      //     {
      //       print("Izquierda"),
      //     }
      // },
      onPanEnd: (_) => zonaManager.timerCancel(),
      onPanDown: (_) {
        zonaOnOff
            ? zonaManager.changeZoneGesture()
            : zonaManager.changeZoneGestureOff();
      },
      child: ContentGestureZone(zonaOnOff: zonaOnOff),
    );
  }
}

class ContentGestureZone extends StatelessWidget {
  ContentGestureZone({
    Key? key,
    required this.zonaOnOff,
  }) : super(key: key);

  final bool zonaOnOff;
  late Color colorBg;
  late Color colorBd;
  @override
  Widget build(BuildContext context) {
    /* Colores */
    zonaOnOff ? colorBg = ThemeAKasa.btnZone : colorBg = ThemeAKasa.btnZoneOff;

    zonaOnOff
        ? colorBd = ThemeAKasa.btnBorderZone
        : colorBd = ThemeAKasa.btnBorderZoneOff;
    ///////////////////////////////S
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 19),
      width: 328,
      height: 190,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorBd,
          width: 2,
        ),
      ),
      child: zonaOnOff
          ? GestureZoneText(
              subText: "Presiona 5 Segundos para desactivar",
              colorBd: colorBd,
            )
          : GestureZoneText(
              subText: "Presiona 2 Segundos para activar",
              colorBd: colorBd,
            ),
    );
  }
}

class GestureZoneText extends StatelessWidget {
  String subText;
  Color colorBd;
  GestureZoneText({
    required this.subText,
    required this.colorBd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Zona de gestos",
          style: TextStyle(
            color: colorBd,
          ),
        ),
        Text(subText),
      ],
    ));
  }
}
