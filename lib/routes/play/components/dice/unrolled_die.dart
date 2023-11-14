import 'package:dicey/routes/play/components/dice/die.dart';
import 'package:flutter/material.dart';

class UnrolledDie extends StatelessWidget {
  final Die die;
  final int size;

  const UnrolledDie({
    super.key,
    required this.die,
    this.size = Die.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final side in die.sides)
          Container(
            width: size.toDouble(),
            height: size.toDouble(),
            color: die.color,
            child: side,
          ),
      ],
    );
  }
}
