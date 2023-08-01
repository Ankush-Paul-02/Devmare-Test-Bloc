import '../../model/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Future<String> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> updateUserPictures(User user, String imageImage);
}