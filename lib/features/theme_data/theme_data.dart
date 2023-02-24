import 'package:flutter/material.dart';

class ThemeDataCreate {
  ThemeData themedata() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 40, 41, 68),
      appBarTheme: const AppBarTheme(
        toolbarTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        color: Color.fromARGB(255, 40, 41, 68),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        border: InputBorder.none,
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      checkboxTheme: CheckboxThemeData(
        splashRadius: 25,
        visualDensity: VisualDensity.comfortable,
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 40, 41, 68)),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
        overlayColor: MaterialStateProperty.all(Colors.green),
        shape: const CircleBorder(),
        side: const BorderSide(
          style: BorderStyle.solid,
          color: Colors.white,
          width: 2,
        ),
      ),
    );
  }

  TextStyle textStyle1() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle2() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle3() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textStyle4() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      color: Color.fromARGB(255, 40, 41, 68),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.elliptical(50, 75),
        bottomRight: Radius.elliptical(50, 75),
        topLeft: Radius.elliptical(50, 75),
        topRight: Radius.elliptical(50, 75),
      ),
    );
  }

  static BoxDecoration boxDecorationLinearGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 40, 41, 69),
          Color.fromARGB(255, 139, 145, 158),
          Color.fromARGB(255, 217, 229, 241),
        ],
      ),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(60),
      ),
    );
  }
}
