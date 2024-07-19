import 'package:creativai/core/errors/failures.dart';
import 'package:creativai/src/domain/entities/message.dart';
import 'package:dartz/dartz.dart';

abstract class MessagesRepository {
  Stream<List<Message>> get getMessages;
  Future<Either<Failure, bool>> sendMessage(String message);
}
