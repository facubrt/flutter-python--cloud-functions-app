import 'package:creativai/src/application/services/messages_service.dart';
import 'package:creativai/src/domain/entities/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_controller.g.dart';

@Riverpod(keepAlive: true)
class MessagesController extends _$MessagesController {
  final MessagesService messagesService = MessagesService();

  @override
  Stream<List<Message>> build() => messagesService.getMessages;

  Future<bool> sendMessage({required String message}) =>
      messagesService.sendMessage(message);
}
