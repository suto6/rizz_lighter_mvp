import 'package:flutter/material.dart';
import 'package:rizz_lighter_mvp/pages/home.dart';

import 'pages/intro.dart';
import 'utils/app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RizzLighter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.creamyOffWhite,
        fontFamily: 'Poppins', // Recommended rounded, friendly font
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brightCleanYellow,
          primary: AppColors.brightCleanYellow,
          secondary: AppColors.deepIndigo,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.softCharcoal),
          headlineSmall: TextStyle(color: AppColors.deepIndigo, fontWeight: FontWeight.bold),
        ),
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}

