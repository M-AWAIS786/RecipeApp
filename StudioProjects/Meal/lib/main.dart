import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/Screens/tabs.dart';


final theme=ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    brightness: Brightness.dark,
    primary: const Color(0xffffffff),
    onPrimary: const Color(0xffffa506),
    secondary:  Color(0xFFFF8500),
    onSecondary: const Color(0xff000000),
    error: const Color(0xffef9a9a),
    onBackground: const Color(0xff000000),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
     home: const TabsScreen(),
    );
  }
}

