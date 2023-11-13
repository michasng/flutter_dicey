import 'dart:math';

import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/separated.dart';
import 'package:dicey/components/text/headline_medium.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/rolled_die.dart';
import 'package:dicey/routes/play/components/player_dice_pools.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final List<Die> availableDice;

  const Game({
    super.key,
    required this.availableDice,
  });

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final _rng = Random();
  List<RolledDie> _rolledDice = [];

  void rollDice(List<Die> diceToRoll) {
    setState(() {
      _rolledDice = diceToRoll
          .map(
            (die) => RolledDie.random(
              die,
              rng: _rng,
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: PlayerDicePools(
            availableDice: widget.availableDice,
            onRollDice: rollDice,
          ),
        ),
        if (_rolledDice.isNotEmpty) ...[
          const Divider(),
          StyledText.headlineMedium(
            child: const Text('Rolled'),
          ),
          const Gap(),
          Row(
            children: _rolledDice.cast<Widget>().separated(const Gap() * 0.5),
          ),
        ],
      ],
    );
  }
}
