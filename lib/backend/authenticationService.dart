import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticationservice {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  SigninWithGoogle({required BuildContext context}) async {
    try {
      // Initialize GoogleSignIn with minimal configuration
      final GoogleSignIn googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        scopes: ['email'], // Minimizing scopes
      );

      // Only sign out if already signed in
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((v) {
        Authenticationservice()
            .setupAuthStateChanges(context: context, direction: '/splash');
      });
    } catch (e) {
      print('Error during Google sign in: $e');
      return null;
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    return await _firebaseAuth.signOut().then((v) {
      
        Authenticationservice()
            .setupAuthStateChanges(context: context, direction: '/splash');
      });
  }

  void setupAuthStateChanges(
      {required BuildContext context, required String direction}) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (context.mounted) {
        context.go(direction);
      }
      
    });
  }
}
