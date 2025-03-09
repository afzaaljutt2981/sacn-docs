import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan_docs/global/buttons/app_primary_button.dart';
import 'package:scan_docs/global/helper/toast.dart';
import 'package:scan_docs/global/utils/app_colors.dart';
import 'package:scan_docs/global/utils/app_images.dart';
import 'package:scan_docs/global/utils/app_text.dart';
import 'package:scan_docs/ui/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                  ? Image.file(File(homeController.imagePath.value))
                  : Image.asset(
                      GlobalImages.appIcon,
                      height: 200.sp,
                    );
            }),
            40.verticalSpace,
            AppPrimaryButton(
              () {
                captureAndProcessImage();
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
                pickFromGalleryAndProcessImage();
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
    );
  }


  Future<void> captureAndProcessImage() async {
    bool hasCameraPermission = await Permission.camera.status.isGranted;

    if (!hasCameraPermission) {
      hasCameraPermission =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!hasCameraPermission) return;

    final directory = await getApplicationSupportDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final imageFilePath = join(directory.path, "$timestamp.jpeg");

    bool isCaptured = false;

    try {
      isCaptured = await EdgeDetection.detectEdge(
        imageFilePath,
        canUseGallery: true,
        androidScanTitle: 'Capture Image',
        androidCropTitle: 'Adjust Image',
        androidCropBlackWhiteTitle: 'B&W Mode',
        androidCropReset: 'Revert',
      );

    } catch (error) {
      AppToast.showToast(error.toString());
    }

    if (!mounted) return;

    if (isCaptured) {
      homeController.pickImage(imageFilePath);
    }
  }

  Future<void> pickFromGalleryAndProcessImage() async {
    bool hasCameraPermission = await Permission.camera.status.isGranted;

    if (!hasCameraPermission) {
      hasCameraPermission =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!hasCameraPermission) return;

    final directory = await getApplicationSupportDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final imageFilePath = join(directory.path, "$timestamp.jpeg");

    bool isCaptured = false;

    try {
      isCaptured = await EdgeDetection.detectEdgeFromGallery(
        imageFilePath,
        androidCropTitle: 'Adjust Image',
        androidCropBlackWhiteTitle: 'B&W Mode',
        androidCropReset: 'Revert',
      );
    } catch (error) {
      AppToast.showToast(error.toString());
    }

    if (!mounted) return;

    if (isCaptured) {
      homeController.pickImage(imageFilePath);
    }
  }
}
