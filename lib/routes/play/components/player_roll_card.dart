import 'dart:math';

import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/separated.dart';
import 'package:dicey/components/text/headline_medium.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/dice/rolled_die.dart';
import 'package:dicey/routes/play/components/player_dice_pools.dart';
import 'package:flutter/material.dart';

class PlayerRollCard extends StatefulWidget {
  final String playerName;
  final List<Die> availableDice;
  final Random rng;

  const PlayerRollCard({
    super.key,
    required this.playerName,
    required this.availableDice,
    required this.rng,
  });

  @override
  State<PlayerRollCard> createState() => _PlayerRollCardState();
}

class _PlayerRollCardState extends State<PlayerRollCard> {
  List<RolledDie> _rolledDice = [];

  void rollDice(List<Die> diceToRoll) {
    setState(() {
      _rolledDice = diceToRoll
          .map(
            (die) => RolledDie.random(
              die,
              rng: widget.rng,
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText.headlineMedium(
              child: Text(widget.playerName),
            ),
            const Divider(),
            Flexible(
              child: PlayerDicePools(
                availableDice: widget.availableDice,
                onRollDice: rollDice,
              ),
            ),
            if (_rolledDice.isNotEmpty) ...[
              const Divider(),
              StyledText.headlineSmall(
                child: const Text('Rolled'),
              ),
              const Gap(),
              Row(
                children:
                    _rolledDice.cast<Widget>().separated(const Gap() * 0.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
