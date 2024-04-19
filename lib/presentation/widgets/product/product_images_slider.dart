import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 220.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            color: AppColors.paleBlue,
            child: CachedNetworkImage(
              width: constraints.maxWidth,
              imageUrl: images[itemIndex],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
