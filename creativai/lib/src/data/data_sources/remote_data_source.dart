import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creativai/core/constants/constants.dart';
import 'package:creativai/core/errors/failures.dart';
import 'package:creativai/src/data/models/message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class RemoteMessagesDataSource {
  Stream<List<MessageModel>> get getMessages;
  Future<bool> sendMessage(String message);
}

class FirestoreRemoteMessagesDataSource implements RemoteMessagesDataSource {
  final Dio dio = Dio();

  @override
  Stream<List<MessageModel>> get getMessages {
    try {
      final snapshots = FirebaseFirestore.instance
          .collection(FIRESTORE_COLLECTION_MESSAGES)
          .orderBy('timestamp', descending: false)
          .snapshots();

      return snapshots.map((snap) => snap.docs.map((message) {
            return MessageModel.fromJson(message.data());
          }).toList());
    } catch (e) {
      throw ServerFailure;
    }
  }

  @override
  Future<bool> sendMessage(String message) async {
    try {
      final path = CLOUD_FUNCTION_PATH + message;
      debugPrint(path);
      final result = await dio.get(path);
      debugPrint(result.statusMessage);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw ServerFailure;
    }
  }
}
