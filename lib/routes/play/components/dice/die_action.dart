enum DieAction {
  heal('mending-heart.png'),
  speed('high-voltage.png'),
  attack('dagger.png'),
  burn('fire.png'),
  explode('bomb.png');

  final String assetPath;

  const DieAction(String assetFileName)
      : assetPath = 'assets/emojis/$assetFileName';
}
