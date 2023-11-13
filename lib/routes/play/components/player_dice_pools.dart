import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/with_separator.dart';
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
      children: [
        Flexible(
          child: ListView(
            children: [
              StyledText.headlineSmall(
                child: const Text('Won\'t be rolled'),
              ),
              DicePool(
                dice: _wontBeRolledDice,
                onTapDie: (die) => setState(() {
                  _wontBeRolledDice.remove(die);
                  _willBeRolledDice.add(die);
                }),
              ),
            ].withSeparator(const Gap()),
          ),
        ),
        const VerticalDivider(),
        Flexible(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyledText.headlineSmall(
                    child: const Text('Will be rolled'),
                  ),
                  ElevatedButton(
                    child: const Text('Roll!'),
                    onPressed: () => widget.onRollDice?.call(_willBeRolledDice),
                  ),
                ],
              ),
              DicePool(
                dice: _willBeRolledDice,
                onTapDie: (die) => setState(() {
                  _willBeRolledDice.remove(die);
                  _wontBeRolledDice.add(die);
                }),
              ),
            ].withSeparator(const Gap()),
          ),
        ),
      ],
    );
  }
}
