import 'dart:math';

import 'package:dicey/components/layout/wrapped.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:dicey/routes/play/components/player_roll_card.dart';
import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final List<Die> availableDice;
  final Random rng;
  final int playerCount;

  const Game({
    super.key,
    required this.availableDice,
    required this.rng,
    this.playerCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 0; i < playerCount; i++)
          PlayerRollCard(
            playerName: 'Player ${i + 1}',
            availableDice: availableDice,
            rng: rng,
          ),
      ].wrapped((item) => Flexible(child: item)),
    );
  }
}
