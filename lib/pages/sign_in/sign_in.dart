import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/notifier/signin_notifier.dart';
import 'package:ulearning_app/pages/sign_in/signin_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _signInController;
  @override
  void initState() {
    _signInController = SignInController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);

    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(title: "Sign In"),
          backgroundColor: AppColors.primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top login buttons
                thirdPartyLogin(),
                // more login options
                Center(
                    child: text14Normal(
                        text: "Or use your email account to login")),
                SizedBox(height: 50.h),
                // Email text box
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address",
                    func: (value) => ref
                        .read(signInNotifierProvider.notifier)
                        .onEmailChange(value)),
                SizedBox(height: 20.h),
                // Password text box
                appTextField(
                    text: "Password",
                    iconName: "assets/icons/lock.png",
                    hintText: "Enter your password",
                    obscureText: true,
                    func: (value) => ref
                        .read(signInNotifierProvider.notifier)
                        .onPasswordChange(value)),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: textUnderline(text: "Forgot password?"),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                    child: appButton(
                        buttonName: "Login",
                        func: () => _signInController.handleSignIn())),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: appButton(
                      buttonName: "Register",
                      isLogin: false,
                      func: () => Navigator.pushNamed(context, "/register")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
