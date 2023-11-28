




import 'package:firebase_auth/firebase_auth.dart';

import 'toast.dart';


class FirebaseAuthService {
  

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseAuthException?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Additional logic for user creation if needed

      return null; // Return null for success
    } on FirebaseAuthException catch (e) {
      return e; // Return FirebaseAuthException for failure
    }
}
  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }

    }
    return null;

  }




}

