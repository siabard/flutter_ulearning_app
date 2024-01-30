import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

// positional optional parameter
toastInfo(
  String msg, {
  Color backgroundColor = AppColors.primaryBackground,
  Color textColor = AppColors.primaryText,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}
