import 'package:dicey/routes/play/components/dice/die_action.dart';

class DieSide {
  final DieAction action;
  final int multiplier;

  const DieSide({
    required this.action,
    this.multiplier = 1,
  });
}
