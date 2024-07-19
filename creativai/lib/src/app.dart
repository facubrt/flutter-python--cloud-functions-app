import 'package:creativai/core/constants/constants.dart';
import 'package:creativai/src/presentation/views/pages/chat_page.dart';
import 'package:flutter/material.dart';

class CreativAI extends StatelessWidget {
  const CreativAI({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}
