import 'package:creativai/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMessageWidget extends ConsumerWidget {
  final String message;
  const AppMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            message,
          ),
        ),
      ),
      leading: const CircleAvatar(
        backgroundImage: AssetImage(CREATIVAI_AVATAR),
        maxRadius: 14,
      ),
      onTap: () {},
    );
  }
}
