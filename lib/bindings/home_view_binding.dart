import 'package:get/get.dart';
import 'package:mediaprobe/controllers/home_view_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewController());
  }
}
