import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color appColor = Color.fromARGB(255, 173, 2, 236);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Companion Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color.fromARGB(255, 199, 3, 243),
        scaffoldBackgroundColor: const Color.fromARGB(255, 252, 252, 252),
        appBarTheme: const AppBarTheme(
          backgroundColor: appColor,
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor,
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
