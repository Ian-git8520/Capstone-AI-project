// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CarDealershipApp());
}

class CarDealershipApp extends StatelessWidget {
  const CarDealershipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elite Auto Dealership',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}