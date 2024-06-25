import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../lib.dart';

class Finance {
  ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.secondary,
      scaffoldBackgroundColor: AppColors.white,
      shadowColor: AppColors.primary,
      disabledColor: AppColors.grey,
      // textSelectionTheme: theme.textSelectionTheme.copyWith(
      //   cursorColor: Blue.primary,
      //   selectionHandleColor: Blue.primary,
      //   selectionColor: Blue.quaternary,
      // ),
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.red,
        background: AppColors.green,
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: AppColors.black,
      ),
      floatingActionButtonTheme: theme.floatingActionButtonTheme.copyWith(
        backgroundColor: AppColors.secondary,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: AppColors.white,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: theme.cardTheme.copyWith(
        shadowColor: AppColors.black,
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.small / 2,
          ),
        ),
      ),
      tabBarTheme: theme.tabBarTheme.copyWith(
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.black,
            width: 4,
          ),
        ),
      ),

      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: theme.dividerTheme.copyWith(
        color: AppColors.black.withOpacity(0.3),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: AppColors.black,
        isDense: true,
        hintStyle: AppTextStyle.regular.copyWith(
          fontSize: AppFontSize.small,
          color: AppColors.black,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppGap.normal,
          horizontal: AppGap.normal,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppBorderRadius.small / 2),
          ),
          borderSide: BorderSide(
            color: TextFieldColors.enabledBorder,
          ),
        ),
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.enabledBorder,
        //   ),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.focusedBorder,
        //   ),
        // ),
        // focusedErrorBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.errorBorder,
        //   ),
        // ),
        // errorBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(AppBorderRadius.small / 2),
        //   ),
        //   borderSide: BorderSide(
        //     color: TextFieldColors.errorBorder,
        //   ),
        // ),
      ),
      splashColor: (kIsWeb || Platform.isAndroid)
          ? AppColors.black.withOpacity(0.1)
          : Colors.transparent,
      highlightColor: (!kIsWeb && Platform.isAndroid)
          ? Colors.transparent
          : AppColors.black.withOpacity(0.1),
      textTheme: theme.textTheme.copyWith().apply(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
    );
  }
}
