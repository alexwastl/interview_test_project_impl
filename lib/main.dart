import 'package:flutter/material.dart';
import 'package:interview_test_project_impl/common/theme/theme.dart';
import 'package:interview_test_project_impl/common/widgets/bottom_nav_bar.dart';
import 'package:interview_test_project_impl/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: ThemeMode.system, // switch theme from system setting
      home: const Scaffold(
        body: SafeArea(child: HomeScreen()),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
