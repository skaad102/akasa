import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metooltip/metooltip.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/services/provider/app_state_manager.dart';
import 'package:prueba_a_kasa/ui/widget/btn_continue.dart';

import 'toolTip/custom_tool_tip.dart';

class FormularioAkasa extends StatelessWidget {
  String textAction;
  FormularioAkasa({required this.textAction, super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateManager>(context);
    return Center(
      child: Column(
        children: [
          MeTooltip(
            // height: 20,
            preferOri: PreferOrientation.up,
            // triangleColor: Color.fromARGB(255, 78, 47, 31),
            allOffset: 0,
            child: GestureDetector(
              child: const Text("Crea tu cuenta"),
              onDoubleTap: () {},
            ),
            tooltipChild: _getTooltipChild,
          ),
          DatosFormulario(),
          BtnContinuar(
            onAction: (() async {
              /* awit validation */
              appState.login("1111111111", "1111");
              GoRouter.of(context).go('/welcome');
            }),
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
    final appState = Provider.of<AppStateManager>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      child: Form(
          child: Column(children: [
        InputForm(
          inputUser: appState.telefono,
          controlerInput: controlerInputTelefono,
          hintText: 'N??mero de Telefono',
          icon: Icons.phone_android_outlined,
          maxLength: 10,
        ),
        const SizedBox(height: 8),
        InputForm(
            inputUser: appState.pin,
            controlerInput: controlerInputPin,
            hintText: 'PIN m??ximo 4 numeros',
            icon: Icons.lock,
            maxLength: 4,
            obscureText: true),
      ])),
    );
  }
}

class InputForm extends StatefulWidget {
  final TextEditingController controlerInput;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final int maxLength;
  final String inputUser;
  const InputForm({
    Key? key,
    required this.controlerInput,
    required this.hintText,
    required this.icon,
    required this.maxLength,
    required this.inputUser,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    // final palabra = Provider.of<AppStateManager>(context,
    //     listen: false); /* actulizar input  */
    // widget.controlerInput.addListener(() {
    //   setState(() {
    //     widget.controlerInput.text = palabra.vozToText;
    //   });
    //   // palabra.setVozToText("");
    // });
    setState(() {
      widget.controlerInput.text = widget.inputUser;
    });
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
        obscureText: widget.obscureText,
        controller: widget.controlerInput,
        decoration: InputDecoration(
          icon: Icon(widget.icon),
          hintText: widget.hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
