import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/widget/btn_continue.dart';

class FormularioAkasa extends StatelessWidget {
  String textAction;
  FormularioAkasa({required this.textAction, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            textAction,
            style: Theme.of(context).textTheme.headline4,
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
          hintText: 'Telefono',
          icon: Icons.phone_android_outlined,
        ),
        const SizedBox(height: 8),
        InputForm(
            controlerInput: controlerInputPin,
            hintText: 'PIN max 4',
            icon: Icons.lock,
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
  const InputForm({
    Key? key,
    required this.controlerInput,
    required this.hintText,
    required this.icon,
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
        onChanged: (value) => print(value),
        keyboardType: TextInputType.number,
        obscureText: obscureText,
        // maxLength: 4,
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
