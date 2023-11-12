import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/die_action.dart';
import 'package:dicey/routes/play/components/dice/die_side.dart';
import 'package:dicey/routes/play/components/dice/rolled_die.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RolledDie(
          Die(
            color: Colors.red,
            sides: [
              DieSide(
                action: DieAction.attack,
              ),
            ],
          ),
          upIndex: 0,
        ),
      ],
    );
  }
}
