import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/die_action.dart';
import 'package:dicey/routes/play/components/dice/die_side.dart';
import 'package:dicey/routes/play/components/dice/rolled_die.dart';
import 'package:dicey/routes/play/components/dice/unrolled_die.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final dice = const [
    Die(
      color: Color(0xff660000),
      sides: [
        DieSide(action: DieAction.attack),
        DieSide(action: DieAction.heal),
        DieSide(action: DieAction.burn),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UnrolledDie(die: dice[0]),
        RolledDie(
          dice[0],
          upIndex: 0,
        ),
      ],
    );
  }
}
