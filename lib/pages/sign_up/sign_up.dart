import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          backgroundColor: AppColors.primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                // more login options
                Center(
                    child: text14Normal(
                        text: "Enter your details below & free sign up")),
                SizedBox(height: 50.h),
                appTextField(
                    text: "User name",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your user name"),
                SizedBox(height: 20.h),
                // Email text box
                appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email address"),
                SizedBox(height: 20.h),
                // Password text box
                appTextField(
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                appTextField(
                  text: "Confirm Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your confirm password",
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: text14Normal(
                      text:
                          "By creating an account you are agreeing with our terms and conditions"),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: appButton(buttonName: "Register", isLogin: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
