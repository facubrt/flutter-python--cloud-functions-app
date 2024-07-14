import 'package:creativai/src/presentation/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class CreativAI extends StatelessWidget {
  const CreativAI({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CreativAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
