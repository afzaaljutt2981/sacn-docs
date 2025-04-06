import 'package:edge_detection/edge_detection.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:scan_docs/global/helper/toast.dart'; 

class HomeController extends GetxController {
  RxString imagePath = ''.obs;

  // Method to pick image from camera
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

    if (isCaptured) {
      pickImage(imageFilePath);
    }
  }

  // Method to pick image from gallery
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

    if (isCaptured) {
      pickImage(imageFilePath);
    }
  }

  // Pick the image
  void pickImage(String image) {
    imagePath.value = image;
  }

  // Save the image to the gallery
    Future<void> saveImageToGallery() async {
    final imagePath = this.imagePath.value;
    if (imagePath.isNotEmpty) {
      try {
        final result = await ImageGallerySaver.saveFile(imagePath);
        if (result != null && result['isSuccess'] == true) {
          AppToast.showToast('Image saved to gallery!');
        } else {
          AppToast.showToast('Failed to save image.');
        }
      } catch (error) {
        AppToast.showToast('Error: ${error.toString()}');
      }
    } else {
      AppToast.showToast('No image to save.');
    }
  }

  // Delete the image
  void deleteImage() {
    imagePath.value = '';
  }
}
