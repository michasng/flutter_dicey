import 'package:dicey/routes/play/components/dice/dice_pool.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';
import 'package:micha_core/extensions/separated.dart';

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
          .map<Widget>((item) => Flexible(child: item))
          .separated(const VerticalDivider())
          .toList(),
    );
  }
}
