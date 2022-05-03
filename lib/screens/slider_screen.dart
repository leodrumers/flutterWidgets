import 'dart:math';

import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double maxWidth = 428;
  double _sliderValue = Random().nextInt(428).toDouble() + 100;

  var _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider Screen')),
      body: Column(children: [
        Slider.adaptive(
          value: _sliderValue,
          min: 100,
          max: maxWidth,
          activeColor: AppTheme.primaryColor,
          inactiveColor: AppTheme.primaryColor.withOpacity(0.5),
          divisions: 7,
          onChanged: _sliderEnable
              ? (value) {
                  _sliderValue = value;
                  setState(() {});
                }
              : null,
        ),
        SwitchListTile.adaptive(
            title: const Text('Slider enabled'),
            activeColor: AppTheme.primaryColor,
            inactiveTrackColor: AppTheme.primaryColor.withOpacity(0.25),
            value: _sliderEnable,
            onChanged: (value) => setState(() {
                  _sliderEnable = value;
                })),
        const AboutListTile(),
        Expanded(
          child: SingleChildScrollView(
            child: Image(
              image: const NetworkImage(
                  'https://i.pinimg.com/originals/80/e0/55/80e05536e0f6caa5cbbad4ed956aa435.png'),
              fit: BoxFit.fill,
              width: _sliderValue,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
