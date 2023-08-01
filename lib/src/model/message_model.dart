// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MessageModel extends Equatable {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final DateTime dateTime;
  final String timeString;

  const MessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.dateTime,
    required this.timeString,
  });

  @override
  List<Object?> get props => [
        id,
        senderId,
        receiverId,
        message,
        dateTime,
        timeString,
      ];

  static List<MessageModel> messages = [
    MessageModel(
        id: 1,
        senderId: 1,
        receiverId: 2,
        message: 'Hey, how are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 2,
        senderId: 2,
        receiverId: 1,
        message: 'I\'m good, thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 3,
        senderId: 1,
        receiverId: 2,
        message: 'I\'m good, as well. Thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 4,
        senderId: 1,
        receiverId: 3,
        message: 'Hey, how are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 5,
        senderId: 3,
        receiverId: 1,
        message: 'I\'m good, thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 6,
        senderId: 1,
        receiverId: 5,
        message: 'Hey, how are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 7,
        senderId: 5,
        receiverId: 1,
        message: 'I\'m good, thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 8,
        senderId: 1,
        receiverId: 6,
        message: 'Hey, how are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 9,
        senderId: 6,
        receiverId: 1,
        message: 'I\'m good, thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 10,
        senderId: 1,
        receiverId: 7,
        message: 'Hey, how are you?',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
    MessageModel(
        id: 11,
        senderId: 7,
        receiverId: 1,
        message: 'I\'m good, thank you.',
        dateTime: DateTime.now(),
        timeString: DateFormat('jm').format(DateTime.now())),
  ];
}
