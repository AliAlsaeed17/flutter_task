// ignore_for_file: depend_on_referenced_packages, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/presentation/resources/app_assets.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  alignment: AlignmentDirectional.center,
      color: Colors.transparent,
      padding: const EdgeInsets.all(5.0),
      child: Lottie.asset(
        AppAssets.loadingImage,
        alignment: AlignmentDirectional.center,
        height: 2.h,
        width: 2.w,
      ),
    );
  }
}
