import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/pages/home.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final theme = ThemeAKasa.light();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: theme,
    );
  }
}
