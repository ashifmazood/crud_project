//import 'package:bca_exam_managment/core/utils/app_colors.dart';
//import 'package:bca_exam_managment/features/models/onbording/onbording_model.dart';
//import 'package:bca_exam_managment/features/view/on_boarding/widgets/onboarding_frame.dart';
//import 'package:bca_exam_managment/features/view/user_type_screen.dart';
import 'package:crud_project/home_page.dart';
import 'package:crud_project/smooth_model.dart/smooth_model.dart';
import 'package:crud_project/smooth_model.dart/smooth_screen.dart';
import 'package:flutter/material.dart';

class Smooth22 extends StatefulWidget {
  const Smooth22({super.key});

  @override
  State<Smooth22> createState() => _Smooth22State();
}

class _Smooth22State extends State<Smooth22> {
   PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
  

    
    
    return Scaffold(
    

      appBar: AppBar(
     //   backgroundColor: AppColors.background,

        automaticallyImplyLeading: false,

        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                SmoothScreenLOcalData.readOnBoardingScreen();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                'skip',
                style: TextStyle(
                  color:  Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                
                //scrollDirection: Axis.horizontal,
                itemCount: SmoothScreenLOcalData.smooth_model.length,
                itemBuilder: (context, index) {
                  return OnboardingFrame(
                    smoothmodel: SmoothScreenLOcalData.smooth_model[index],
                    pageController: pageController,
                    currentIndex: index,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
              decoration: BoxDecoration(
                color:
                    currentIndex == SmoothScreenLOcalData.smooth_model.length
                        ? Colors.white
                        : Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  if (currentIndex == SmoothScreenLOcalData.smooth_model.length - 1) {
                    SmoothScreenLOcalData.readOnBoardingScreen();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  currentIndex == SmoothScreenLOcalData.smooth_model.length - 1
                      ? 'Let’s Start'
                      : 'Next',
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        currentIndex == SmoothScreenLOcalData.smooth_model.length - 1
                            ? Colors.orange
                            : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}