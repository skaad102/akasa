import 'package:flutter/material.dart';

import '../widget/login/content_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
