import 'package:get/get.dart';

class DataController extends GetxController {
  var bottomNavIndex = 0.obs;

  void changeBottomNavIndex(int index) => bottomNavIndex.value = index;
}
