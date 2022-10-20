import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_a_kasa/services/bloc/btn_block_bloc.dart';
import 'package:prueba_a_kasa/ui/pages/home.dart';
import 'package:prueba_a_kasa/ui/pages/login.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final theme = ThemeAKasa.light();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BtnBlockBloc>(
          create: (context) => BtnBlockBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: theme,
      ),
    );
  }
}
