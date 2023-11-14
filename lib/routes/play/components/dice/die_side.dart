import 'package:dicey/routes/play/components/dice/die_action.dart';
import 'package:flutter/widgets.dart';

class DieSide extends StatelessWidget {
  final DieAction action;
  final int multiplier;

  const DieSide({
    super.key,
    required this.action,
    this.multiplier = 1,
  });

  @override
  Widget build(BuildContext context) {
    final image = Image(image: action.image);

    switch (multiplier) {
      case 1:
        return image;
      case 2:
        return Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Flexible(child: image),
              ],
            ),
            Row(
              children: [
                Flexible(child: image),
                const Spacer(),
              ],
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Row(
              children: [
                const Spacer(flex: 1),
                Flexible(
                  flex: 2,
                  child: image,
                ),
                const Spacer(flex: 1),
              ],
            ),
            Row(
              children: [
                Flexible(child: image),
                Flexible(child: image),
              ],
            ),
          ],
        );
      default:
        throw Exception('invalid multiplier $multiplier');
    }
  }
}
