import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';

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
      margin: EdgeInsets.only(top: 15),
      child: text24Normal(text: title),
    ),
    Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 30, right: 30),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ),
        );
      }
    },
    child: Container(
      width: 325,
      height: 50,
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
