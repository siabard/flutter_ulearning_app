import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            backgroundColor: AppColors.primaryBackground,
            body: Center(
              child: Text("Sign in page"),
            ),
          ),
        ));
  }
}
