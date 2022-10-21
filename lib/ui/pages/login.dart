import 'package:flutter/material.dart';

import '../../router/router_page.dart';
import '../widget/login/content_login.dart';

class LoginPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AkasaPage.login,
      key: ValueKey(AkasaPage.login),
      child: const LoginPage(),
    );
  }

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ContentLogin(),
        ),
      ),
    );
  }
}
