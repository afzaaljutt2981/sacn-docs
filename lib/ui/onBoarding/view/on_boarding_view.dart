import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scan_docs/global/appConfigs/global_hive.dart';
import 'package:scan_docs/global/buttons/app_primary_button.dart';
import 'package:scan_docs/global/utils/app_colors.dart';
import 'package:scan_docs/global/utils/app_navigations.dart';
import 'package:scan_docs/global/utils/app_text.dart';
import 'package:scan_docs/ui/home/view/home_view.dart';
import 'package:scan_docs/ui/onBoarding/model/on_boarding_text_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final OnBoardingModel model = OnBoardingModel();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNextPressed() {
    if (_currentIndex < model.onboardingData.length - 1) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      preferences.put('startup_session', 'true');
      AppNavigation.pushAndRemoveUntilPage(
          context, PageTransitionType.rightToLeft, const HomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.kScafoldColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: model.onboardingData.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final data = model.onboardingData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      data["image"]!,
                      width: screenWidth,
                      fit: BoxFit.cover,
                    ),
                    25.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            data["heading"] ?? '',
                            40,
                            FontWeight.w500,
                            AppColors.kBlackColor,
                            textAlign: TextAlign.left,
                          ),
                          AppText(
                            data["subHeading"] ?? '',
                            19,
                            FontWeight.w400,
                            AppColors.kPrimaryColor,
                            textAlign: TextAlign.start,
                          ),
                          20.verticalSpace,
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.h, horizontal: 20.w),
                            width: screenWidth,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.08),
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: AppText(
                              data["description"] ?? '',
                              14,
                              FontWeight.w400,
                              AppColors.kBlackColor,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          if (_currentIndex == 3) 20.verticalSpace,
                          if (_currentIndex == 3)
                            AppPrimaryButton(
                              () {
                                preferences.put('startup_session', 'true');
                                _onNextPressed();
                              },
                              AppText('Sign in/Register', 17, FontWeight.normal,
                                  AppColors.kWhiteColor),
                              height: 60.h,
                            )
                        ],
                      ),
                    ),
                    20.verticalSpace,
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 20.sp,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 50.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(model.onboardingData.length, (i) {
                      return Padding(
                        padding: EdgeInsets.only(right: 15.sp),
                        child: Container(
                          decoration: BoxDecoration(
                            color: i == _currentIndex
                                ? AppColors.kPrimaryColor
                                : const Color(0xFFE2CABD),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          height: 9.sp,
                          width: 9.sp,
                        ),
                      );
                    }),
                  ),
                  _currentIndex == 3
                      ? GestureDetector(
                          onTap: () {
                            preferences.put('startup_session', 'true');
                            _onNextPressed();
                          },
                          child: AppText(
                              'Use Now', 16, FontWeight.w400, Colors.grey))
                      : SizedBox(
                          width: 50.w,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// GestureDetector(
              //   onTap: ()=>       _onNextPressed(),
              //   child: Container(
              //     height: 60.sp,
              //     decoration: const BoxDecoration(
              //         shape: BoxShape.circle
              //     ),
                
              //     child: Image.asset( _currentIndex == 0 ?'assets/images/onB1Button.png' :  _currentIndex == 1 ? 'assets/images/onB2Button.png' :'assets/images/onB3Button.png' ),
              //   ),
              // )
