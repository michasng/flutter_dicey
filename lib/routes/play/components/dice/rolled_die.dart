import 'dart:math';

import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class RolledDie extends StatelessWidget {
  final Die die;
  final int upIndex;
  final int size;

  const RolledDie(
    this.die, {
    super.key,
    required this.upIndex,
    this.size = Die.size,
  });

  @override
  Widget build(BuildContext context) {
    final upSide = die.sides[upIndex];

    return Container(
      width: size.toDouble(),
      height: size.toDouble(),
      color: die.color,
      child: Image.asset(upSide.action.assetPath),
    );
  }

  factory RolledDie.random(
    Die die, {
    Random? rng,
    int size = Die.size,
  }) {
    return RolledDie(
      die,
      upIndex: (rng ?? Random()).nextInt(die.sides.length),
      size: size,
    );
  }
}
