import 'package:dicey/routes/play/components/dice/dice_pool.dart';
import 'package:dicey/routes/play/components/dice/die.dart';
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
  final List<Die> wontBeRolledDice = [];
  final List<Die> willBeRolledDice = [];

  @override
  void initState() {
    super.initState();

    wontBeRolledDice.addAll(widget.availableDice);
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
                dice: wontBeRolledDice,
                onTapDie: (die) => setState(() {
                  wontBeRolledDice.remove(die);
                  willBeRolledDice.add(die);
                }),
              ),
            ],
          ),
        ),
        const VerticalDivider(),
        Flexible(
          child: ListView(
            children: [
              Text(
                'Will be rolled',
                style: theme.textTheme.headlineSmall,
              ),
              DicePool(
                dice: willBeRolledDice,
                onTapDie: (die) => setState(() {
                  willBeRolledDice.remove(die);
                  wontBeRolledDice.add(die);
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
