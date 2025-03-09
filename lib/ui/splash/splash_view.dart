import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scan_docs/global/appConfigs/global_hive.dart';
import 'package:scan_docs/global/utils/app_colors.dart';
import 'package:scan_docs/global/utils/app_images.dart';
import 'package:scan_docs/global/utils/app_navigations.dart';
import 'package:scan_docs/ui/home/view/home_view.dart';
import 'package:scan_docs/ui/onBoarding/view/on_boarding_view.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();

    if (preferences.get('startup_session') != null &&
        preferences.get('startup_session') == 'true') {
           Timer(const Duration(seconds: 3), () {
       AppNavigation.pushAndRemoveUntilPage(
          context, PageTransitionType.fade, const HomeView());
      });

    } else {
      Timer(const Duration(seconds: 3), () {
        AppNavigation.pushAndRemoveUntilPage(
            context, PageTransitionType.fade, const OnBoardingScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kScafoldColor,
        body: Center(child: Image.asset(GlobalImages.appIcon)));
  }
}
