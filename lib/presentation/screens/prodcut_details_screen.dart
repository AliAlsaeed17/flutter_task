import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';
import 'package:flutter_task/presentation/widgets/product/product_images_slider.dart';
import 'package:flutter_task/presentation/widgets/products/product_ratingbar.dart';
import 'package:flutter_task/presentation/widgets/shared/body_text.dart';
import 'package:flutter_task/presentation/widgets/shared/section_title.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesSlider(images: product.images),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: product.title),
                    SizedBox(height: 20.h),
                    BodyText(text: 'Description: ${product.description}'),
                    SizedBox(height: 10.h),
                    BodyText(text: 'Price: ${product.price}'),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyText(text: 'Rating: '),
                        ProductRatingBar(rate: product.rating),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
