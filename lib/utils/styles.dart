import 'package:flutter/material.dart';
import 'package:pasibase_test/utils/constants.dart';

class AppTheme {
  
  static double elementSpacing = 18;

  static const Color error = Color(0xBBE64A19); 
  static const Color warning = Color(0xBBE39219); 

  static const Color primaryColor = Color(0xFF959595);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const Color lightGrey = Color(0xFFE6E7E8);
  static const Color grey = Color(0xFF707070);
  static const Color buttonColor = Color(0xFFFFDD5E);

   static ThemeData themeData(BuildContext context) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE6E7E8), //R0 G127 B163
            primary:const Color(0xFF959595),
            secondary: const Color(0xFFFFDD5E), //R87 G51 B147
            tertiary: const Color(0xFF1565C0)), //R237 G139 B0
        useMaterial3: true,
        primaryColor: const Color(0xFF959595),
        fontFamily: "Roboto",
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF7E7E7E))),
        textTheme: const TextTheme(
          headlineSmall:
               TextStyle(color:  Colors.black),
          headlineMedium:
               TextStyle(color:  Colors.black),
          headlineLarge:
               TextStyle(color:  Colors.black),
        ),
         bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
            elevation: 0,
            showUnselectedLabels: true,
            backgroundColor:  Color(0xFF2E2E2E),
            selectedIconTheme:  IconThemeData(color:Color(0xFFFFDD5E) ),
            unselectedIconTheme:  IconThemeData( color: Color(0xFFFFFFFF)),
            unselectedItemColor:  Color(0xFFFFFFFF),
            unselectedLabelStyle:   TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
            selectedLabelStyle:TextStyle(
                                color: Color(0xFFFFDD5E),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                ),
            selectedItemColor: Color(0xFFFFDD5E)),
          iconTheme: const IconThemeData(color: Colors.white),
          iconButtonTheme:const  IconButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStatePropertyAll( Color(0xFF1565C0)))),
          popupMenuTheme: const PopupMenuThemeData(
            color: Colors.white
          )
        );
   }

  static TextStyle customtitleMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: SizeConfig.textLarge(context),
        );
  }

  static TextStyle customtitleSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: SizeConfig.textSmall(context),
        );
  }
}