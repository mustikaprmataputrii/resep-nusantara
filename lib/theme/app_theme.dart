import 'package:flutter/material.dart';

const ink = Color(0xFF292D25);
const muted = Color(0xFF888A80);
const paper = Color(0xFFFAF8F2);
const olive = Color(0xFF687354);

Color recipeColor(String recipeId) => switch (recipeId) {
  'soto' => const Color(0xFFD39A42),
  'gado' => const Color(0xFF63855B),
  'pancake' => const Color(0xFFC67F55),
  'sate' => const Color(0xFFA7603C),
  _ => const Color(0xFFB85B36),
};

ThemeData buildAppTheme() => ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: paper,
  colorScheme: ColorScheme.fromSeed(seedColor: olive, surface: paper),
  fontFamily: 'Roboto',
  appBarTheme: const AppBarTheme(backgroundColor: paper, foregroundColor: ink),
);
