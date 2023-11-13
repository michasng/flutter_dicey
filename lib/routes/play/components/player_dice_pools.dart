import 'package:dicey/components/layout/separated.dart';
import 'package:dicey/components/layout/wrapped.dart';
import 'package:dicey/routes/play/components/dice/dice_pool.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class PlayerDicePools extends StatelessWidget {
  final List<Die> wontBeRolledDice;
  final List<Die> willBeRolledDice;
  final void Function(Die die) moveToWillBeRolled;
  final void Function(Die die) moveToWontBeRolled;

  const PlayerDicePools({
    super.key,
    required this.wontBeRolledDice,
    required this.willBeRolledDice,
    required this.moveToWillBeRolled,
    required this.moveToWontBeRolled,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DicePool(
          title: const Text('Won\'t be rolled'),
          dice: wontBeRolledDice,
          onTapDie: moveToWillBeRolled,
        ),
        DicePool(
          title: const Text('Will be rolled'),
          dice: willBeRolledDice,
          onTapDie: moveToWontBeRolled,
        ),
      ]
          .wrapped((item) => Flexible(child: item))
          .separated(const VerticalDivider()),
    );
  }
}
