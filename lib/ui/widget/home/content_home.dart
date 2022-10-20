import 'package:flutter/material.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

import '../btn_continue.dart';

class ContentHome extends StatefulWidget {
  const ContentHome({super.key});

  @override
  State<ContentHome> createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  double _continuousValue = 10;
  final theme = ThemeAKasa.light();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Center(
        child: Column(
          children: [
            //
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                image: DecorationImage(
                  image: const AssetImage('assets/img/img1.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 110,
                width: 110,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            //
            const SizedBox(height: 20),
            Slider(
              value: _continuousValue,
              min: 0,
              max: 100,
              onChanged: changeSlider,
            ),
            BtnContinuar(),
          ],
        ),
      ),
    );
  }

  // METHODS
  void changeSlider(double val) {
    setState(() {
      _continuousValue = val;
    });
  }
}
