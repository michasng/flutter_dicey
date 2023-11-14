import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class UnrolledDie extends StatelessWidget {
  final Die die;

  const UnrolledDie({
    super.key,
    required this.die,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final side in die.sides)
          Container(
            width: Die.size.toDouble(),
            height: Die.size.toDouble(),
            color: die.color,
            child: side,
          ),
      ],
    );
  }
}
