import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

class ZonaGestos extends StatelessWidget {
  bool activo;
  ZonaGestos({this.activo = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 19),
        width: 328,
        height: 190,
        decoration: BoxDecoration(
          color: ThemeAKasa.btnZone,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ThemeAKasa.btnBorderZone,
            width: 2,
          ),
        ),
        child: activo
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "Zona de gestos",
                    style: TextStyle(
                      color: ThemeAKasa.btnBorderZone,
                    ),
                  ),
                  Text("Aqui se mostraran los gestos"),
                ],
              ))
            : const Center(
                child: Text("No activo"),
              ));
  }
}
