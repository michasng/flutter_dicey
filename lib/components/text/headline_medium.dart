import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final Widget child;
  final TextStyle? Function(ThemeData theme) getTextStyle;

  const StyledText({
    required this.child,
    required this.getTextStyle,
    super.key,
  });

  factory StyledText.displayLarge({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.displayLarge,
      );

  factory StyledText.displayMedium({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.displayMedium,
      );

  factory StyledText.displaySmall({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.displaySmall,
      );

  factory StyledText.headlineLarge({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.headlineLarge,
      );

  factory StyledText.headlineMedium({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.headlineMedium,
      );

  factory StyledText.headlineSmall({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.headlineSmall,
      );

  factory StyledText.titleLarge({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.titleLarge,
      );

  factory StyledText.titleMedium({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.titleMedium,
      );

  factory StyledText.titleSmall({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.titleSmall,
      );

  factory StyledText.bodyLarge({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.bodyLarge,
      );

  factory StyledText.bodyMedium({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.bodyMedium,
      );

  factory StyledText.bodySmall({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.bodySmall,
      );

  factory StyledText.labelLarge({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.labelLarge,
      );

  factory StyledText.labelMedium({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.labelMedium,
      );

  factory StyledText.labelSmall({required Widget child}) => StyledText(
        child: child,
        getTextStyle: (theme) => theme.textTheme.labelSmall,
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = getTextStyle(theme);

    if (style == null) return child;

    return DefaultTextStyle(
      style: style,
      child: child,
    );
  }
}
