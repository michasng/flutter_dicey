import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class RolledDie extends StatelessWidget {
  final Die model;
  final int upIndex;

  const RolledDie(
    this.model, {
    super.key,
    required this.upIndex,
  });

  @override
  Widget build(BuildContext context) {
    final upSide = model.sides[upIndex];

    return Container(
      width: Die.size.toDouble(),
      height: Die.size.toDouble(),
      color: model.color,
      child: Image.asset(upSide.action.assetPath),
    );
  }
}
