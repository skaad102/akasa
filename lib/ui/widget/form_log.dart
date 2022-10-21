import 'package:flutter/material.dart';
import 'package:metooltip/metooltip.dart';
import 'package:prueba_a_kasa/ui/widget/btn_continue.dart';

import 'toolTip/custom_tool_tip.dart';

class FormularioAkasa extends StatelessWidget {
  String textAction;
  FormularioAkasa({required this.textAction, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MeTooltip(
            height: 150,
            preferOri: PreferOrientation.up,
            // triangleColor: Color.fromARGB(255, 78, 47, 31),
            message:
                'Crear una cuenta es gratis y te permite acceder a más funciones',
            allOffset: 0,
            child: Text("Crea tu cuenta"),
            tooltipChild: _getTooltipChild,
          ),
          DatosFormulario(),
          BtnContinuar(
            onAction: () {
              print("object");
            },
            text: 'Continuar',
            height: 60,
          )
        ],
      ),
    );
  }

  TooltipBase _getTooltipChild(DefTooltipType p) {
    return CustomTooltip(
      message: p.message,
      height: p.height,
      preferOri: p.preferOri,
      allOffset: p.allOffset,
      triangleColor: p.triangleColor,
      padding: p.padding,
      margin: p.margin,
      decoration: p.decoration,
      animation: p.animation,
      textStyle: p.textStyle,
      target: p.target,
      entry: p.entry,
      targetSize: p.targetSize,
      customDismiss: p.customDismiss,
    );
  }
}

class DatosFormulario extends StatelessWidget {
  DatosFormulario({
    Key? key,
  }) : super(key: key);

  /* Controller */
  final controlerInputTelefono = TextEditingController();
  final controlerInputPin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      child: Form(
          child: Column(children: [
        InputForm(
          controlerInput: controlerInputTelefono,
          hintText: 'Número de Telefono',
          icon: Icons.phone_android_outlined,
          maxLength: 10,
        ),
        const SizedBox(height: 8),
        InputForm(
            controlerInput: controlerInputPin,
            hintText: 'PIN máximo 4 numeros',
            icon: Icons.lock,
            maxLength: 4,
            obscureText: true),
      ])),
    );
  }
}

class InputForm extends StatelessWidget {
  final TextEditingController controlerInput;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final int maxLength;
  const InputForm({
    Key? key,
    required this.controlerInput,
    required this.hintText,
    required this.icon,
    required this.maxLength,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: TextFormField(
        // maxLength: maxLength,
        onChanged: (value) => print(value),
        keyboardType: TextInputType.number,
        obscureText: obscureText,
        controller: controlerInput,
        decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
