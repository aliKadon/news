import 'package:flutter/material.dart';
import 'package:news_app/app/presentation/styles_manager.dart';
import 'package:news_app/app/presentation/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.greyLight,
    // cardView theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s2),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s0,
        shadowColor: ColorManager.transparent,
        titleTextStyle:
            getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.r8)),
        ),
        disabledColor: ColorManager.grey,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.greyLight),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getMediumStyle(
                color: ColorManager.white, fontSize: FontSize.s18),
            // foregroundColor: ColorManager.primary,
            backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r8)))),
  );
}
