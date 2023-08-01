// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:devmate/src/model/models.dart';
import 'package:equatable/equatable.dart';

class UserMatchModel extends Equatable {
  final int id;
  final int userId;
  final User matchedUser;
  final List<ChatModel> chats;

  const UserMatchModel({
    required this.id,
    required this.userId,
    required this.matchedUser,
    required this.chats,
  });

  @override
  List<Object?> get props => [id, userId, matchedUser];

  static List<UserMatchModel> matches = [
    UserMatchModel(
      id: 1,
      userId: 1,
      matchedUser: User.users[1],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 2)
          .toList(),
    ),
    UserMatchModel(
      id: 2,
      userId: 1,
      matchedUser: User.users[2],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 3)
          .toList(),
    ),
    UserMatchModel(
      id: 3,
      userId: 1,
      matchedUser: User.users[3],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 4)
          .toList(),
    ),
    UserMatchModel(
      id: 4,
      userId: 1,
      matchedUser: User.users[4],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 5)
          .toList(),
    ),
    UserMatchModel(
      id: 5,
      userId: 1,
      matchedUser: User.users[5],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 6)
          .toList(),
    ),
    UserMatchModel(
      id: 6,
      userId: 1,
      matchedUser: User.users[6],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 7)
          .toList(),
    ),
    UserMatchModel(
      id: 7,
      userId: 1,
      matchedUser: User.users[7],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 8)
          .toList(),
    ),
    UserMatchModel(
      id: 8,
      userId: 1,
      matchedUser: User.users[8],
      chats: ChatModel.chats
          .where((chat) => chat.userId == 1 && chat.matchedUserId == 9)
          .toList(),
    ),
  ];
}