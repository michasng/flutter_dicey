import 'package:dicey/components/layout/gap.dart';
import 'package:dicey/components/layout/with_separator.dart';
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
    final theme = Theme.of(context);

    return Row(
      children: [
        Flexible(
          child: ListView(
            children: [
              Text(
                'Won\'t be rolled',
                style: theme.textTheme.headlineSmall,
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
                  Text(
                    'Will be rolled',
                    style: theme.textTheme.headlineSmall,
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
