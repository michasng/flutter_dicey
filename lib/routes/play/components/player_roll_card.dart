import 'dart:math';

import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/separated.dart';
import 'package:dicey/components/layout/wrapped.dart';
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
  final List<Die> _wontBeRolledDice = [];
  final List<Die> _willBeRolledDice = [];
  List<RolledDie> _rolledDice = [];

  @override
  void initState() {
    super.initState();
    _wontBeRolledDice.addAll(widget.availableDice);
  }

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

  void clearDice() {
    setState(() {
      _rolledDice = [];
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
            SizedBox(
              height: Die.size.toDouble(),
              child: Row(
                children: [
                  StyledText.headlineSmall(
                    child: Text(widget.playerName),
                  ),
                  const Gap(),
                  ElevatedButton(
                    onPressed: _willBeRolledDice.isEmpty
                        ? null
                        : () => rollDice(_willBeRolledDice),
                    child: const Text('Roll!'),
                  ),
                  IconButton(
                    onPressed: _rolledDice.isEmpty ? null : clearDice,
                    icon: const Icon(Icons.clear_all),
                  ),
                  if (_rolledDice.isNotEmpty)
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: _rolledDice
                              .cast<Widget>()
                              .separated(const Gap() * 0.5),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Divider(),
            Flexible(
              child: PlayerDicePools(
                wontBeRolledDice: _wontBeRolledDice,
                willBeRolledDice: _willBeRolledDice,
                moveToWillBeRolled: (die) => setState(() {
                  // _wontBeRolledDice.remove(die);
                  _willBeRolledDice.add(die);
                }),
                moveToWontBeRolled: (die) => setState(() {
                  _willBeRolledDice.remove(die);
                  // _wontBeRolledDice.add(die);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
