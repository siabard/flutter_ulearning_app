import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (state.password != state.rePassword) {
      toastInfo("Your password did not match");
      return;
    }

    if (state.password.isEmpty ||
        state.rePassword.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("You password should not be empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);

        toastInfo("asn email has been sente to veryfy your accoutn.");

        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("This password is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo("This email address has already been registered");
      } else if (e.code == 'user-not-found') {
        toastInfo("User not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // show register page...
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
