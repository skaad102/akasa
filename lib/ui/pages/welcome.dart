import 'package:flutter/material.dart';

import '../../router/router_page.dart';

class WelcomePage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AkasaPage.welcome,
      key: ValueKey(AkasaPage.welcome),
      child: const WelcomePage(),
    );
  }

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Bienvenido")),
    );
  }
}
