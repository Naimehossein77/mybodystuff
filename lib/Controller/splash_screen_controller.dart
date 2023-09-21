import 'package:get/get.dart';
import 'package:mybodystuff/Utils/routes.dart';


class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(Routes.homePageRoute);
    });
  }
}
