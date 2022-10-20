import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/widget/home/background.dart';
import 'package:prueba_a_kasa/ui/widget/home/content_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          BackgrounImage(),
          ContentHome(),
        ]),
      ),
    );
  }
}
