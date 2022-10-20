import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BtnContinuar extends StatelessWidget {
  final theme = ThemeAKasa.light();
  final double height;
  final String text;

  BtnContinuar({super.key, this.height = 75, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: Implementar navegación
      },
      child: Container(
        width: 328,
        height: height,
        decoration: BoxDecoration(
          color: ThemeAKasa.btnBackground,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: theme.textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.black,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
