import 'package:creativai/src/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel(
      {required super.type,
      required super.text,
      required super.createdBy,
      required super.timestamp});

  factory MessageModel.fromJson(Map<dynamic, dynamic> json) {
    return MessageModel(
      type: json['type'],
      text: json['text'],
      createdBy: json['createdBy'],
      timestamp: json['timestamp'].toString(),
    );
  }

  factory MessageModel.fromEntity(Message message) {
    return MessageModel(
        type: message.type,
        text: message.text,
        createdBy: message.createdBy,
        timestamp: message.timestamp);
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'type': type,
      'text': text,
      'createdBy': createdBy,
      'timestamp': timestamp.toString(),
    };
  }
}
