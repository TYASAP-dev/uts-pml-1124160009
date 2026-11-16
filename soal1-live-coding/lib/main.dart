import 'package:flutter/material.dart';
import 'package:soal1uts/profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Muhammad Aditya Saputra',
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        useMaterial3:  true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      darkTheme: ThemeData(
        useMaterial3:  true,
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}
