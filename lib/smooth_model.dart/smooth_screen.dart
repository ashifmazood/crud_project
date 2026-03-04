//import 'package:bca_exam_managment/core/utils/app_colors.dart';
//import 'package:bca_exam_managment/features/models/onbording/onbording_model.dart';
import 'package:crud_project/smooth_model.dart/smooth_model.dart';
import 'package:flutter/material.dart';
//import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFrame extends StatelessWidget {
  OnboardingFrame({
    super.key,
    required this.smoothmodel,
    required this.pageController,
    required this.currentIndex,
  });
  final SmoothModel smoothmodel;
  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(smoothmodel.image, fit: BoxFit.contain),
          ),
          SizedBox(height: 15,),
          
        SizedBox(height: 35,),
          Text(
            smoothmodel.title,   
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black,
              //     .white, // Color here doesn't matter due to the gradient.
            ),
          ),
          SizedBox(height: 25,),
          Text(
            smoothmodel.description,
            style: TextStyle(
              // maxLines: 3,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black26,
            ),
            textAlign: TextAlign.center,
            maxLines: 7,
          ),
          SizedBox(height: 35,),
          SmoothPageIndicator(
            controller:  pageController  ,
            count:SmoothScreenLOcalData.smooth_model.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              spacing: 5,
              activeDotColor: Colors.orange,
              dotColor: Colors.grey,
              paintStyle: PaintingStyle.fill,
            ),
          ),
        ],
      ),
    );
  }
}