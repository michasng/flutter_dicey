import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/unrolled_die.dart';
import 'package:flutter/material.dart';

class DicePool extends StatelessWidget {
  final List<Die> dice;
  final void Function(Die die)? onTapDie;

  const DicePool({
    super.key,
    required this.dice,
    this.onTapDie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final die in dice)
          InkWell(
            child: UnrolledDie(die: die),
            onTap: () => onTapDie?.call(die),
          ),
      ],
    );
  }
}
