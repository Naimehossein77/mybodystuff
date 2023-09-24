import 'package:get/get.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/routes.dart';

class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    String youtube_video_url = await FirebaseRepo().getYoutubeVideoLink();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.homePageRoute,arguments: youtube_video_url);
    });
  }
}
