import 'dart:js';

import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF101020),
  brightness: Brightness.dark,
);

final textTheme = TextTheme(
  bodySmall: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
);
