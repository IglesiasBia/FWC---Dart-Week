import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secundaryFont => 'MPlus1P';

  // Primary font
  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont);

  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont);

  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFont);

  TextStyle get textPrimaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont);

  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFont);

  // Secundary font
  TextStyle get textSecundaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secundaryFont);

  TextStyle get textSecundaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secundaryFont);

  TextStyle get textSecundaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secundaryFont);

  TextStyle get textSecundaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secundaryFont);

  TextStyle get labelTexteField => textSecundaryFontRegular.copyWith(
        color: ColorsApp.i.greyDart,
      );

  TextStyle get textSecundaryFontExtraBoldPrimaryColor =>
      textSecundaryFontExtraBold.copyWith(
        color: ColorsApp.i.primary,
      );

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.white,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.black,
      );

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: ColorsApp.i.primary,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
