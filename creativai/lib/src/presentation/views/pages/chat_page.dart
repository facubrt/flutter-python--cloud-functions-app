import 'package:creativai/core/constants/constants.dart';
import 'package:creativai/src/presentation/providers/messages_controller.dart';
import 'package:creativai/src/presentation/views/widgets/app_message_widget.dart';
import 'package:creativai/src/presentation/views/widgets/message_field_widget.dart';
import 'package:creativai/src/presentation/views/widgets/user_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesController = ref.watch(messagesControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          APP_NAME,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: messagesController.when(
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (messages) {
          return Column(
            children: [
              Expanded(
                child: messages.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            NO_MESSAGES_FOUND_TEXT,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black45,
                                ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return (message.createdBy == CREATED_BY_USER)
                              ? UserMessageWidget(
                                  message: message.text,
                                )
                              : AppMessageWidget(
                                  message: message.text,
                                );
                        },
                      ),
              ),
              const MessageFieldWidget(),
            ],
          );
        },
      ),
    );
  }
}