import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';

Widget appButton(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
          color:
              isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: text16Normal(
        text: buttonName,
        color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
      )),
    ),
  );
}
