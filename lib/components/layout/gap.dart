import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  static const double defaultGapSize = 16;

  final double size;

  const Gap({
    super.key,
    this.size = defaultGapSize,
  });

  Gap operator *(double factor) {
    return Gap(size: size * factor);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
    );
  }
}
