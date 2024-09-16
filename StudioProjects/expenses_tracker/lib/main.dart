import 'package:expenses_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor:  Color.fromARGB(255, 101, 123, 171),
);

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 92, 96, 96));


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          brightness: Brightness.dark,
          appBarTheme:  AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onPrimary,
          ),

          cardTheme:  CardTheme().copyWith(
          color: Color.fromARGB(100, 233, 18, 255),
          margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
          textTheme:  TextTheme().copyWith(
            titleLarge:  TextStyle().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            titleMedium:  TextStyle().copyWith(color: Colors.black, fontSize: 18,),
            titleSmall:  TextStyle().copyWith(color: Colors.black, fontSize: 18,),
          )

      ),

      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme:  AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.onPrimary,
          ),
          cardTheme:  CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onSecondary,
          ),),
      textTheme:  TextTheme().copyWith(
        titleLarge:  TextStyle().copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        titleMedium:  TextStyle().copyWith(color: Colors.black, fontSize: 18,),
        titleSmall:  TextStyle().copyWith(color: Colors.black, fontSize: 18,),
      )
      ),
      themeMode: ThemeMode.system, //default
      home: const ExpensesScreen(),
    );
  }
}
