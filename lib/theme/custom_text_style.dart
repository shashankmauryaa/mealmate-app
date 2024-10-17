import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineLargePoppins => theme.textTheme.headlineLarge!.poppins;

  static get headlineLargeRegular => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallBlack90001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90001,
      );
  static get headlineSmallBlack90002 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90002,
      );
  static get headlineSmallBlack90004 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black90004,
      );
  static get headlineSmallGray600 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray600,
      );
  static get headlineSmallGray60001 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray60001,
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallRegular => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Title text style
  static get titleLargeBlack90003 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90003.withOpacity(0.5),
      );
  static get titleLargeBlack90003Regular =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90003.withOpacity(0.5),
        fontWeight: FontWeight.w400,
      );
  static get titleLargeOnPrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get titleLargeSansSerifCollection =>
      theme.textTheme.titleLarge!.sansSerifCollection.copyWith(
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  TextStyle get timesNewRoman {
    return copyWith(
      fontFamily: 'Times New Roman',
    );
  }

  TextStyle get sansSerifCollection {
    return copyWith(
      fontFamily: 'Sans Serif Collection',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
