import 'package:creativai/core/errors/failures.dart';
import 'package:creativai/src/data/data_sources/remote_data_source.dart';
import 'package:creativai/src/domain/entities/message.dart';
import 'package:creativai/src/domain/repositories/messages_repository.dart';
import 'package:dartz/dartz.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final RemoteMessagesDataSource remoteDataSource =
      FirestoreRemoteMessagesDataSource();

  @override
  Stream<List<Message>> get getMessages => remoteDataSource.getMessages;

  @override
  Future<Either<Failure, bool>> sendMessage(String message) async {
    try {
      final bool result = await remoteDataSource.sendMessage(message);
      return Right(result);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}
