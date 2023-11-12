import 'dart:math';

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
    final theme = Theme.of(context);

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
          Text(
            'Rolled',
            style: theme.textTheme.headlineMedium,
          ),
          const Divider(),
          Row(
            children: [
              for (final rolledDie in _rolledDice) rolledDie,
            ],
          ),
        ],
      ],
    );
  }
}
