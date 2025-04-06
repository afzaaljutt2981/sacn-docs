import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scan_docs/global/buttons/app_primary_button.dart';
import 'package:scan_docs/global/utils/app_colors.dart';
import 'package:scan_docs/global/utils/app_images.dart';
import 'package:scan_docs/global/utils/app_text.dart';
import 'package:scan_docs/ui/home/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.kScafoldColor,
      appBar: AppBar(
        title: AppText(
            'Scan Your Documents', 18, FontWeight.w600, AppColors.kWhiteColor),
        backgroundColor: AppColors.kPrimaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.verticalSpace,
              AppText(
                "Effortlessly scan your important documents with a tap!",
                16,
                FontWeight.normal,
                AppColors.kBlackColor,
                textAlign: TextAlign.center,
              ),
              40.verticalSpace,
              Obx(() {
                return (homeController.imagePath.value != '')
                    ? Stack(
                        children: [
                          Image.file(File(homeController.imagePath.value)),
                          Positioned(
                            right: 0.w,
                            top: 0.h,
                            child: PopupMenuButton<String>(
                              icon: Icon(
                                Icons.more_vert,
                                color: AppColors.kBlackColor,
                                size: 25.sp,
                              ),
                              onSelected: (value) {
                                if (value == 'delete') {
                                  homeController.deleteImage();
                                } else if (value == 'save') {
                                  homeController.saveImageToGallery();
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return {'delete', 'save to gallery'}
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: AppText(choice, 14.sp, FontWeight.w400, AppColors.kBlackColor)
                                  );
                                }).toList();
                              },
                            ),
                          ),
                        ],
                      )
                    : Image.asset(
                        GlobalImages.appIcon,
                        height: 200.sp,
                      );
              }),
              40.verticalSpace,
              AppPrimaryButton(
                () {
                  homeController.captureAndProcessImage();
                },
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: AppColors.kWhiteColor,
                      size: 25.sp,
                    ),
                    10.horizontalSpace,
                    AppText("Scan from Camera", 16, FontWeight.normal,
                        AppColors.kWhiteColor),
                  ],
                ),
                height: 60.h,
              ),
              20.verticalSpace,
              AppPrimaryButton(
                () {
                  homeController.pickFromGalleryAndProcessImage();
                },
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: AppColors.kWhiteColor,
                      size: 25.sp,
                    ),
                    10.horizontalSpace,
                    AppText("Upload from Gallery", 16, FontWeight.normal,
                        AppColors.kWhiteColor),
                  ],
                ),
                height: 60.h,
              ),
              30.verticalSpace,
              AppText(
                "Make scanning easier and store your memories with ease!",
                16,
                FontWeight.normal,
                AppColors.kBlackColor,
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
