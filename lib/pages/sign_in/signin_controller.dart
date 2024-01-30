import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/signin_notifier.dart';

class SignInController {
  late WidgetRef ref;

  SignInController({required this.ref});

  handleSignIn() {
    var state = ref.read(signInNotifierProvider);

    print("email: ${state.email}");
    print("password: ${state.password}");
  }
}
