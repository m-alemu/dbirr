import 'package:dbirr/helpers/theme/app_theme.dart';
import 'package:dbirr/widgets/my_constant.dart';
import 'package:dbirr/widgets/my_text_style.dart';
import 'package:dbirr/widgets/responsive.dart';
import 'package:flutter/material.dart';

class My {
  // entry point of the package
  init() {}

  static void changeTheme(ThemeData theme) {
    AppTheme.theme = theme;
  }

  static void setTextDirection(TextDirection direction) {
    AppTheme.textDirection = direction;
  }

  static void changeFontFamily(GoogleFontFunction fontFamily) {
    MyTextStyle.changeFontFamily(fontFamily);
  }

  static void changeDefaultFontWeight(Map<int, FontWeight> defaultFontWeight) {
    MyTextStyle.changeDefaultFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextFontWeight(
      Map<MyTextType, int> defaultFontWeight) {
    MyTextStyle.changeDefaultTextFontWeight(defaultFontWeight);
  }

  static void changeDefaultTextSize(Map<MyTextType, double> defaultTextSize) {
    MyTextStyle.changeDefaultTextSize(defaultTextSize);
  }

  static void changeDefaultLetterSpacing(
      Map<MyTextType, double> defaultLetterSpacing) {
    MyTextStyle.changeDefaultLetterSpacing(defaultLetterSpacing);
  }

  static setConstant(MyConstantData constantData) {
    MyConstant.setConstant(constantData);
  }

  static setFlexSpacing(double spacing) {
    MyScreenMedia.flexSpacing = spacing;
  }

  static setFlexColumns(int columns) {
    MyScreenMedia.flexColumns = columns;
  }
}
