import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  final navigatorKey = GlobalKey<NavigatorState>();

  void changeTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Profil Aditya',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode,
      home: LoginPage(
        onLogin: () {
          navigatorKey.currentState!.pushReplacementNamed('/profile');
        },
      ),
      routes: {
        '/profile': (context) => ProfilePage(onThemeChanged: changeTheme),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
