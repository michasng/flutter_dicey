import 'package:dicey/routes/play/components/dice/rolled_die.dart';
import 'package:flutter/material.dart';
import 'package:micha_core/micha_core.dart';

class PlayerRolledDice extends StatelessWidget {
  final List<RolledDie> rolledDice;

  const PlayerRolledDice({
    super.key,
    required this.rolledDice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Rolled'),
        const Gap(),
        Row(
          children: rolledDice.cast<Widget>().separated(const Gap() * 0.5),
        ),
      ],
    );
  }
}
