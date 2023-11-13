import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/with_separator.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/unrolled_die.dart';
import 'package:flutter/material.dart';

class DicePool extends StatelessWidget {
  final Widget title;
  final List<Die> dice;
  final void Function(Die die)? onTapDie;

  const DicePool({
    super.key,
    required this.title,
    required this.dice,
    this.onTapDie,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        title,
        const Gap(),
        ...<Widget>[
          for (final die in dice)
            InkWell(
              child: UnrolledDie(die: die),
              onTap: () => onTapDie?.call(die),
            ),
        ].withSeparator(const Gap() * 0.5),
      ],
    );
  }
}
