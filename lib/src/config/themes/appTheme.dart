import 'package:flutter/material.dart';
import 'package:ny_time_articles/src/core/utils/colors.dart';

import '../../core/utils/sizes.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColor,
      primarySwatch: AppColors.primaryColorSwatch,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primaryColor,
          elevation: 4,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
          iconTheme: IconThemeData(color: AppColors.appBarIconThemeColor)),
      textTheme: TextTheme(
        displayMedium: TextStyle(
          fontSize: Sizes.text2,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        displayLarge: TextStyle(
          fontSize: Sizes.text1,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: Sizes.text3,
          color: Colors.grey,
        ),
      ));
}
