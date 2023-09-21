import 'package:get/get.dart';
import 'package:mybodystuff/Controller/splash_screen_controller.dart';


class SplashScreenBinding extends Bindings {
  RxInt reload = 0.obs;
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
