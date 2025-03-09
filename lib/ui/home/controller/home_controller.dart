import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController{

 RxString imagePath =  ''.obs;

pickImage(String image) {
  imagePath.value = image;
}


}