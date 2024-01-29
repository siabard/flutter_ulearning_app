import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/*
  prefferedSize widget gives you a height or space from the appbar downwards and we can
  put child in the given space.

*/
AppBar buildAppbar() {
  return AppBar(
    centerTitle: true,
    bottom: PreferredSize(
      child: Container(
        height: 1,
        color: Colors.red,
      ),
      preferredSize: Size.fromHeight(
        1,
      ),
    ),
    title: text16Normal(text: "Login", color: AppColors.primaryText),
  );
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField(
    {String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obscureText = false}) {
  return Container(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text14Normal(text: text),
          SizedBox(height: 5.h),
          Container(
            width: 325.w,
            height: 50.h,
            //color: Colors.red,
            decoration: appBoxDecorationTextField(),
            // row containg icon & field
            child: Row(
              children: [
                // for shwing icons
                Container(
                  margin: EdgeInsets.only(left: 17.w),
                  child: appImage(imagePath: iconName),
                ),
                Container(
                  width: 260.w,
                  height: 50.h,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      // default border without any input
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: obscureText,
                  ),
                ),
              ],
            ),
          )
        ],
      ));
}
