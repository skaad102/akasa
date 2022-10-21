import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/router/router_page.dart';

import '../model/app_state_manager.dart';

class SplashPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AkasaPage.splash,
      key: ValueKey(AkasaPage.splash),
      child: const SplashPage(),
    );
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("cargando"),
    );
  }
}
