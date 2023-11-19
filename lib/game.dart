import 'dart:math';

import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/player_roll_card.dart';
import 'package:flutter/material.dart';
import 'package:micha_core/micha_core.dart';

class Game extends StatelessWidget {
  final List<Die> availableDice;
  final Random rng;
  final int playerCount;

  const Game({
    super.key,
    required this.availableDice,
    required this.rng,
    required this.playerCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: playerCount
          .times<Widget>(
            (index) => PlayerRollCard(
              playerName: 'Player ${index + 1}',
              availableDice: availableDice,
              rng: rng,
            ),
          )
          .map((item) => Flexible(child: item))
          .toList(),
    );
  }
}
