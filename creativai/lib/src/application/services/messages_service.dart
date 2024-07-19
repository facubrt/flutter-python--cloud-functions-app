import 'package:creativai/src/data/repositories/messages_repository_impl.dart';
import 'package:creativai/src/domain/entities/message.dart';
import 'package:creativai/src/domain/repositories/messages_repository.dart';

class MessagesService {
  final MessagesRepository repository = MessagesRepositoryImpl();

  Stream<List<Message>> get getMessages => repository.getMessages;

  Future<bool> sendMessage(String message) async {
    final result = await repository.sendMessage(message);
    return result.fold((l) => throw l, (r) => r);
  }
}
