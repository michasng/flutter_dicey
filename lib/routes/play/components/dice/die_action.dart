import 'package:flutter/rendering.dart';

enum DieAction {
  heal('mending-heart.png'),
  speed('high-voltage.png'),
  attack('dagger.png'),
  burn('fire.png'),
  explode('bomb.png');

  final String _assetPath;

  const DieAction(String assetFileName)
      : _assetPath = 'assets/emojis/$assetFileName';

  AssetImage get image => AssetImage(_assetPath);
}
