// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});

  final GoException error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('An error occurred:', style: TextStyle(fontSize: 18.sp)),
              SizedBox(height: 15.h),
              Text(error.toString(), style: TextStyle(fontSize: 16.sp)),
              ElevatedButton(
                onPressed: () {
                  // Handle the error and navigate to a different screen or perform any other action
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
