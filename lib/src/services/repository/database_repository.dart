import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmate/src/model/user_model.dart';
import 'package:devmate/src/services/repository/base_database_repository.dart';
import 'package:devmate/src/services/storage/storage_repository.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userId) {
    return _firebaseFirestore.collection('users').doc(userId).snapshots().map(
          (snap) => User.fromSnapshot(snap),
        );
  }

  @override
  Future<void> updateUserPictures(User user, String imageImage) async {
    String downloadUrl = await StorageRepository().getDownloadUrl(
      user,
      imageImage,
    );
    return _firebaseFirestore.collection('users').doc(user.id).update(
      {
        'imageUrls': FieldValue.arrayUnion([downloadUrl]),
      },
    );
  }

  @override
  Future<String> createUser(User user) async {
    String docId =
        await _firebaseFirestore.collection('users').add(user.toMap()).then(
              (value) => value.id,
            );

    return docId;
  }

  @override
  Future<void> updateUser(User user) {
    return _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(
          user.toMap(),
        )
        .then(
          (value) => print('User document updated...'),
        );
  }
}
