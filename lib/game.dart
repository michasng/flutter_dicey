import 'dart:math';

import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/with_separator.dart';
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
          const Divider(),
          Text(
            'Rolled',
            style: theme.textTheme.headlineMedium,
          ),
          const Gap(),
          Row(
            children: <Widget>[
              for (final rolledDie in _rolledDice) rolledDie,
            ].withSeparator(const Gap() * 0.5),
          ),
        ],
      ],
    );
  }
}
