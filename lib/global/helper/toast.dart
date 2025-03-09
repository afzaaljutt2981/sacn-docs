import 'package:fluttertoast/fluttertoast.dart';
import 'package:scan_docs/global/utils/app_colors.dart';

class AppToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.kPrimaryColor,
      textColor: AppColors.kWhiteColor,
      fontSize: 16.0,
    );
  }
}
