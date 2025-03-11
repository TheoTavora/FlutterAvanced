import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliderAdaptativo extends StatelessWidget {
  const SliderAdaptativo({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.android) {
      return Slider(
        onChanged: (valor) {},
        value: 10,
        min: 0,
        max: 20,
      );
    } else if (platform == TargetPlatform.iOS) {
      return CupertinoSlider(
        onChanged: (valor) {},
        value: 10,
        min: 0,
        max: 20,
      );
    } else {
      return Slider.adaptive(
        onChanged: (valor) {},
        value: 10,
        min: 0,
        max: 20,
      );
    }
  }
}
