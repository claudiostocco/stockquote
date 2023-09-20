import 'package:flutter/material.dart';
import 'package:show_graph/constants/global.dart';
import 'package:show_graph/pages/home.dart';

void main() {
  runApp(const AppStart());
}

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kTitle,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
    );
  }
}
