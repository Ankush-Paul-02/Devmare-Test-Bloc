// ignore_for_file: avoid_print
import 'package:devmate/src/services/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

// class FirebaseAuthMethods {
//   final FirebaseAuth _auth;
//
//   FirebaseAuthMethods(this._auth);
//
//   // Email sign up
//   Future<void> signInWithEmail({
//     required String email,
//     required String password,
//     // required BuildContext context,
//   }) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       // VxToast.show(context, msg: e.toString());
//     }
//   }
// }

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
