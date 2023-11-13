import 'package:dicey/components/layout/separated.dart';
import 'package:dicey/components/layout/wrapped.dart';
import 'package:dicey/components/text/headline_medium.dart';
import 'package:dicey/routes/play/components/dice/dice_pool.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class PlayerDicePools extends StatefulWidget {
  final List<Die> availableDice;
  final void Function(List<Die> dice)? onRollDice;

  const PlayerDicePools({
    super.key,
    required this.availableDice,
    this.onRollDice,
  });

  @override
  State<PlayerDicePools> createState() => _PlayerDicePoolsState();
}

class _PlayerDicePoolsState extends State<PlayerDicePools> {
  final List<Die> _wontBeRolledDice = [];
  final List<Die> _willBeRolledDice = [];

  @override
  void initState() {
    super.initState();

    _wontBeRolledDice.addAll(widget.availableDice);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DicePool(
          title: StyledText.headlineSmall(
            child: const Text('Won\'t be rolled'),
          ),
          dice: _wontBeRolledDice,
          onTapDie: (die) => setState(() {
            _wontBeRolledDice.remove(die);
            _willBeRolledDice.add(die);
          }),
        ),
        DicePool(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledText.headlineSmall(
                child: const Text('Will be rolled'),
              ),
              ElevatedButton(
                onPressed: _willBeRolledDice.isEmpty
                    ? null
                    : () => widget.onRollDice?.call(_willBeRolledDice),
                child: const Text('Roll!'),
              ),
            ],
          ),
          dice: _willBeRolledDice,
          onTapDie: (die) => setState(() {
            _willBeRolledDice.remove(die);
            _wontBeRolledDice.add(die);
          }),
        ),
      ]
          .wrapped((item) => Flexible(child: item))
          .separated(const VerticalDivider()),
    );
  }
}
