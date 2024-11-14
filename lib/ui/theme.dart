import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d3216),
      surfaceTint: Color(0xffa04023),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbd5536),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff9e430c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffff9a68),
      onSecondaryContainer: Color(0xff491900),
      tertiary: Color(0xff004b58),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff257180),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff231916),
      surface: Color(0xfffef8f4),
      onSurface: Color(0xff1d1b19),
      surfaceVariant: Color(0xfffadcd4),
      onSurfaceVariant: Color(0xff56423c),
      outline: Color(0xff8a726b),
      outlineVariant: Color(0xffddc0b9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302d),
      inverseOnSurface: Color(0xfff5f0eb),
      inversePrimary: Color(0xffffb59f),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff3b0a00),
      primaryFixedDim: Color(0xffffb59f),
      onPrimaryFixedVariant: Color(0xff80290d),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff7b2f00),
      tertiaryFixed: Color(0xffa8edff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff8cd1e2),
      onTertiaryFixedVariant: Color(0xff004e5b),
      surfaceDim: Color(0xffded9d5),
      surfaceBright: Color(0xfffef8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ee),
      surfaceContainer: Color(0xfff2ede8),
      surfaceContainerHigh: Color(0xffece7e3),
      surfaceContainerHighest: Color(0xffe6e2dd),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff7b2509),
      surfaceTint: Color(0xffa04023),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbd5536),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff742c00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffba5822),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004a56),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff257180),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff231916),
      surface: Color(0xfffef8f4),
      onSurface: Color(0xff1d1b19),
      surfaceVariant: Color(0xfffadcd4),
      onSurfaceVariant: Color(0xff523e39),
      outline: Color(0xff705a54),
      outlineVariant: Color(0xff8d756f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302d),
      inverseOnSurface: Color(0xfff5f0eb),
      inversePrimary: Color(0xffffb59f),
      primaryFixed: Color(0xffbd5536),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff9d3e21),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffba5822),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff9a4109),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff357e8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff126574),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d5),
      surfaceBright: Color(0xfffef8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ee),
      surfaceContainer: Color(0xfff2ede8),
      surfaceContainerHigh: Color(0xffece7e3),
      surfaceContainerHighest: Color(0xffe6e2dd),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff460d00),
      surfaceTint: Color(0xffa04023),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7b2509),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff401500),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff742c00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00262e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004a56),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff231916),
      surface: Color(0xfffef8f4),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xfffadcd4),
      onSurfaceVariant: Color(0xff31201b),
      outline: Color(0xff523e39),
      outlineVariant: Color(0xff523e39),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff32302d),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe7e1),
      primaryFixed: Color(0xff7b2509),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff591300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff742c00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff501d00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004a56),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00323b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded9d5),
      surfaceBright: Color(0xfffef8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f3ee),
      surfaceContainer: Color(0xfff2ede8),
      surfaceContainerHigh: Color(0xffece7e3),
      surfaceContainerHighest: Color(0xffe6e2dd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb59f),
      surfaceTint: Color(0xffffb59f),
      onPrimary: Color(0xff5f1500),
      primaryContainer: Color(0xffbd5536),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffbd9f),
      onSecondary: Color(0xff561f00),
      secondaryContainer: Color(0xfff5854b),
      onSecondaryContainer: Color(0xff2f0d00),
      tertiary: Color(0xff8cd1e2),
      onTertiary: Color(0xff00363f),
      tertiaryContainer: Color(0xff166776),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff1b110e),
      onBackground: Color(0xfff2ded9),
      surface: Color(0xff141311),
      onSurface: Color(0xffe6e2dd),
      surfaceVariant: Color(0xff56423c),
      onSurfaceVariant: Color(0xffddc0b9),
      outline: Color(0xffa58b84),
      outlineVariant: Color(0xff56423c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2dd),
      inverseOnSurface: Color(0xff32302d),
      inversePrimary: Color(0xffa04023),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff3b0a00),
      primaryFixedDim: Color(0xffffb59f),
      onPrimaryFixedVariant: Color(0xff80290d),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff7b2f00),
      tertiaryFixed: Color(0xffa8edff),
      onTertiaryFixed: Color(0xff001f25),
      tertiaryFixedDim: Color(0xff8cd1e2),
      onTertiaryFixedVariant: Color(0xff004e5b),
      surfaceDim: Color(0xff141311),
      surfaceBright: Color(0xff3b3936),
      surfaceContainerLowest: Color(0xff0f0e0c),
      surfaceContainerLow: Color(0xff1d1b19),
      surfaceContainer: Color(0xff211f1d),
      surfaceContainerHigh: Color(0xff2b2a27),
      surfaceContainerHighest: Color(0xff363432),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbba7),
      surfaceTint: Color(0xffffb59f),
      onPrimary: Color(0xff310700),
      primaryContainer: Color(0xffe0704f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbd9f),
      onSecondary: Color(0xff2f0d00),
      secondaryContainer: Color(0xfff5854b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff90d5e6),
      onTertiary: Color(0xff00191f),
      tertiaryContainer: Color(0xff559baa),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1b110e),
      onBackground: Color(0xfff2ded9),
      surface: Color(0xff141311),
      onSurface: Color(0xfffffaf5),
      surfaceVariant: Color(0xff56423c),
      onSurfaceVariant: Color(0xffe1c4bd),
      outline: Color(0xffb89d96),
      outlineVariant: Color(0xff967e77),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2dd),
      inverseOnSurface: Color(0xff2b2a27),
      inversePrimary: Color(0xff822a0f),
      primaryFixed: Color(0xffffdbd1),
      onPrimaryFixed: Color(0xff280500),
      primaryFixedDim: Color(0xffffb59f),
      onPrimaryFixedVariant: Color(0xff691900),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff240900),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff602300),
      tertiaryFixed: Color(0xffa8edff),
      onTertiaryFixed: Color(0xff001418),
      tertiaryFixedDim: Color(0xff8cd1e2),
      onTertiaryFixedVariant: Color(0xff003c46),
      surfaceDim: Color(0xff141311),
      surfaceBright: Color(0xff3b3936),
      surfaceContainerLowest: Color(0xff0f0e0c),
      surfaceContainerLow: Color(0xff1d1b19),
      surfaceContainer: Color(0xff211f1d),
      surfaceContainerHigh: Color(0xff2b2a27),
      surfaceContainerHighest: Color(0xff363432),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb59f),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbba7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbb9d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff3fcff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff90d5e6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1b110e),
      onBackground: Color(0xfff2ded9),
      surface: Color(0xff141311),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff56423c),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffe1c4bd),
      outlineVariant: Color(0xffe1c4bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e2dd),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff541200),
      primaryFixed: Color(0xffffe0d8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbba7),
      onPrimaryFixedVariant: Color(0xff310700),
      secondaryFixed: Color(0xffffe1d4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbb9d),
      onSecondaryFixedVariant: Color(0xff2c0c00),
      tertiaryFixed: Color(0xffb6f0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff90d5e6),
      onTertiaryFixedVariant: Color(0xff00191f),
      surfaceDim: Color(0xff141311),
      surfaceBright: Color(0xff3b3936),
      surfaceContainerLowest: Color(0xff0f0e0c),
      surfaceContainerLow: Color(0xff1d1b19),
      surfaceContainer: Color(0xff211f1d),
      surfaceContainerHigh: Color(0xff2b2a27),
      surfaceContainerHighest: Color(0xff363432),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
