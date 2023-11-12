import 'dart:ui';

import 'package:dicey/routes/play/components/dice/die_side.dart';

class Die {
  static const size = 64;

  final Color color;
  final List<DieSide> sides;

  const Die({
    required this.color,
    required this.sides,
  });
}
