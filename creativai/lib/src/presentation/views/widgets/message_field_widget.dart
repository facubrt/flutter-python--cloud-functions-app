import 'package:creativai/core/constants/constants.dart';
import 'package:creativai/src/presentation/providers/messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageFieldWidget extends ConsumerWidget {
  const MessageFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textController = TextEditingController();
    final focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        onTapOutside: (event) => focusNode.unfocus(),
        decoration: InputDecoration(
          hintText: MESSAGE_FIELD_HINT_TEXT,
          filled: true,
          fillColor: Colors.black12,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100)),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
            ),
            onPressed: () {
              ref
                  .read(messagesControllerProvider.notifier)
                  .sendMessage(message: textController.text);
              textController.clear();
            },
          ),
        ),
        onFieldSubmitted: (value) {
          ref
              .read(messagesControllerProvider.notifier)
              .sendMessage(message: textController.text);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
