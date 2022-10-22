import 'package:flutter/material.dart';
import 'dart:math' show pi;

class BtnAction extends StatelessWidget {
  String textAction;
  Color backgroundColor;
  Color textColor;
  IconData icon;
  Function onAction;
  String msSemantic;

  BtnAction(
      {required this.textAction,
      required this.backgroundColor,
      required this.textColor,
      required this.icon,
      required this.onAction,
      required this.msSemantic,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      child: Semantics(
        label: msSemantic,
        child: GestureDetector(
          onTap: () => onAction(),
          child: Column(children: [
            Container(
              width: 69,
              height: 69,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: textColor,
                  width: 3,
                ),
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Icon(
                  icon,
                  color: textColor,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              textAction,
              style: Theme.of(context).textTheme.headline4,
            )
          ]),
        ),
      ),
    );
  }
}
