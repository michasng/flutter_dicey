import 'package:dicey/game.dart';
import 'package:flutter/material.dart';

class PlayRoute extends StatelessWidget {
  const PlayRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Game(),
    );
  }
}
