import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/widget/home/background.dart';
import 'package:prueba_a_kasa/ui/widget/home/content_home.dart';

import '../../router/router_page.dart';

class HomePage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AkasaPage.home,
      key: ValueKey(AkasaPage.home),
      child: const HomePage(),
    );
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
