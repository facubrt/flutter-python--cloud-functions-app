import 'package:flutter/material.dart';

class UserMessageWidget extends StatelessWidget {
  final String message;
  const UserMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            message,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
