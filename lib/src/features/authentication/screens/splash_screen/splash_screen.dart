import 'package:agri_x/src/constants/image_string.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image(image: AssetImage(SplashIcon)),
        )
      ],
    ));
  }
}
