import 'package:flutter/material.dart';

class CustomFlutterLogo extends StatelessWidget {
  final double size;
  const CustomFlutterLogo({
    super.key,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: const ColorFilter.matrix(
          <double>[
            0.393,
            0.769,
            0.189,
            0,
            0,
            0.349,
            0.686,
            0.168,
            0,
            0,
            0.272,
            0.534,
            0.131,
            0,
            0,
            0,
            0,
            0,
            1,
            0
          ],
        ),
        child: FlutterLogo(
          size: size,
        ),
      );
}
