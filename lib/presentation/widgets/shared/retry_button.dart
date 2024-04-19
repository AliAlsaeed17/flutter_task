// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RetryButton extends StatelessWidget {
  final VoidCallback onTap;
  const RetryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'اعادة المحاولة',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10, decoration: TextDecoration.underline),
              ),
              Icon(
                FontAwesomeIcons.repeat,
                color: AppColors.softAsh,
                size: 35.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
