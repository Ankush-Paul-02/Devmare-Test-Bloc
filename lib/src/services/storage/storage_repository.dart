// ignore_for_file: avoid_print

import 'dart:io';

import 'package:devmate/src/model/models.dart';
import 'package:devmate/src/services/repository/database_repository.dart';
import 'package:devmate/src/services/storage/base_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(User user, XFile image) async {
    try {
      await storage
          .ref('${user.id}/${image.name}')
          .putFile(
            File(image.path),
          )
          .then(
            (p0) => DatabaseRepository().updateUserPictures(user, image.name),
          );
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<String> getDownloadUrl(User user, String imageName) async {
    String downloadUrl =
        await storage.ref('${user.id}/$imageName').getDownloadURL();
    return downloadUrl;
  }
}
