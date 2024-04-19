import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBar(
          initialRating: rate,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20.sp,
          ratingWidget: RatingWidget(
            full: const Icon(
              Icons.star,
              color: AppColors.smokeGray,
            ),
            half: const Icon(
              Icons.star_half,
              color: AppColors.smokeGray,
            ),
            empty: const Icon(
              Icons.star,
              color: AppColors.softAsh,
            ),
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
