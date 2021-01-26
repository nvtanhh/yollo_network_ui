import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yollo_behance/bottom_navigator.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  static final Map<int, Color> color = {
    50: Color.fromRGBO(20, 20, 20, .1),
    100: Color.fromRGBO(20, 20, 20, .2),
    200: Color.fromRGBO(20, 20, 20, .3),
    300: Color.fromRGBO(20, 20, 20, .4),
    400: Color.fromRGBO(20, 20, 20, .5),
    500: Color.fromRGBO(20, 20, 20, .6),
    600: Color.fromRGBO(20, 20, 20, .7),
    700: Color.fromRGBO(20, 20, 20, .8),
    800: Color.fromRGBO(20, 20, 20, .9),
    900: Color.fromRGBO(20, 20, 20, 1),
  };
  MaterialColor primeColor = MaterialColor(0xFF141414, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yollo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme:
            GoogleFonts.montserratTextTheme().apply(bodyColor: Colors.black87),
      ),
      home: MyNavigator(),
    );
  }
}
