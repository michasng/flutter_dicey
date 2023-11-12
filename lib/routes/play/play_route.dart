import 'package:dicey/game.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/die_action.dart';
import 'package:dicey/routes/play/components/dice/die_side.dart';
import 'package:flutter/material.dart';

class PlayRoute extends StatelessWidget {
  final dice = const [
    Die(
      color: Color(0xff660000),
      sides: [
        DieSide(action: DieAction.attack, multiplier: 2),
        DieSide(action: DieAction.attack),
        DieSide(action: DieAction.attack),
        DieSide(action: DieAction.heal),
        DieSide(action: DieAction.speed),
        DieSide(action: DieAction.burn),
      ],
    ),
    Die(
      color: Color(0xff006666),
      sides: [
        DieSide(action: DieAction.speed, multiplier: 3),
        DieSide(action: DieAction.speed, multiplier: 2),
        DieSide(action: DieAction.speed),
        DieSide(action: DieAction.attack),
        DieSide(action: DieAction.burn),
        DieSide(action: DieAction.burn),
      ],
    ),
  ];

  const PlayRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Game(availableDice: dice),
      ),
    );
  }
}
