import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF101010),
  brightness: Brightness.dark,
);

final textTheme = TextTheme(
  bodySmall: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
);
