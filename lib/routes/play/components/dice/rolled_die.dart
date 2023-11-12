import 'dart:math';

import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class RolledDie extends StatelessWidget {
  final Die die;
  final int upIndex;

  const RolledDie(
    this.die, {
    super.key,
    required this.upIndex,
  });

  @override
  Widget build(BuildContext context) {
    final upSide = die.sides[upIndex];

    return Container(
      width: Die.size.toDouble(),
      height: Die.size.toDouble(),
      color: die.color,
      child: Image.asset(upSide.action.assetPath),
    );
  }

  factory RolledDie.random(Die die, {Random? rng}) {
    return RolledDie(
      die,
      upIndex: (rng ?? Random()).nextInt(die.sides.length),
    );
  }
}
