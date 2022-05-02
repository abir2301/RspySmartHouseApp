import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      primaryColor: const Color(0xffE0A601),
      secondaryHeaderColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        // ignore: unnecessary_const
        headline4:
            GoogleFonts.poppins(color: const Color(0xffC9C9C9), fontSize: 12),
        headline3: const TextStyle(color: Color(0xffE0A601)),
        headline1: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headline6: const TextStyle(
            color: Color(0xffE0A601),
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppinss',
            fontStyle: FontStyle.normal),
        headline2: const TextStyle(
          fontSize: 15,
        ),
        button: const TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
      ),
      iconTheme: const IconThemeData(color: Color(0xffE0A601), opacity: 0.8),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: const Color(0xffE0A601),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.black,
        elevation: 5,
      )));

  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    secondaryHeaderColor: Colors.purple.shade200,

    appBarTheme: const AppBarTheme(
      elevation: 5,
      backgroundColor: Colors.blue,
    ),
    //scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.blue,
      elevation: 5,
    )),

    textTheme: TextTheme(
      headline4: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
      headline3: const TextStyle(color: Colors.blue),
      headline1: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      headline6: const TextStyle(
          color: Colors.black87,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppinss',
          fontStyle: FontStyle.normal),
      headline2: const TextStyle(
        fontSize: 15,
      ),
      button: const TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),
    ),
    iconTheme: IconThemeData(
      color: Colors.purple.shade200,
    ),
  );
}
