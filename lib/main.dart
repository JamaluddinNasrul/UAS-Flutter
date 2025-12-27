import 'package:flutter/material.dart';
import 'package:dimmah/home_page.dart';
import 'package:dimmah/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA53D3D)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
