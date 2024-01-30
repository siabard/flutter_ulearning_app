import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appOnboardingPage({
  required PageController controller,
  int index = 0,
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subTitle = "",
  required BuildContext context,
}) {
  return Column(children: [
    Image.asset(
      imagePath,
      fit: BoxFit.fitWidth,
    ),
    Container(
      margin: EdgeInsets.only(top: 15.h),
      child: text24Normal(text: title),
    ),
    Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: text16Normal(text: subTitle),
    ),
    _nextButton(index, controller, context),
  ]);
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Navigator.pushNamed(context, "/signIn");
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: const EdgeInsets.only(
        top: 100,
        left: 25,
        right: 25,
      ),
      decoration: appBoxShadow(),
      child: Center(
          child:
              text16Normal(text: "next", color: AppColors.primaryBackground)),
    ),
  );
}
