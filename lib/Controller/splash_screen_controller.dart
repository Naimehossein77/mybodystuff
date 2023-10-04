import 'dart:developer';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/routes.dart';

import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  VideoPlayerController? videoPlayerController;
  RxString prodId = '1'.obs;
  RxString prodName = 'UNSTOPPABLE 1.0'.obs;
  RxString prodSerialNumber = '07'.obs;

  @override
  void onInit() async {
    _assignArgumentValue();
    // log('DeviceId: ${await getDeviceId()}');
    // String youtubeVideoUrl = await FirebaseRepo().getYoutubeVideoLink();
    // kLog('youtubeLink: $youtubeVideoUrl');
    await _initializeVideoPlayer();
    super.onInit();
    _delay('');
  }

  _delay(String youtubeVideoUrl) {
    Future.delayed(const Duration(seconds: 6), () {
      if (FirebaseRepo().auth.currentUser == null) {
        Get.toNamed(Routes.loginpageRoute);
      } else {
        Get.offAllNamed(Routes.homePageRoute, arguments: youtubeVideoUrl);
      }
    });
  }

  _assignArgumentValue() {
    if (Get.arguments != null) {
      prodId.value = Get.arguments[0];
      prodName.value = Get.arguments[2];
      prodSerialNumber.value = Get.arguments[1];
    }
  }

  Future<void> _initializeVideoPlayer() async {
    // videoPlayerController =
    //     VideoPlayerController.asset('assets/videos/$prodId.mp4');
    // await videoPlayerController!.initialize();
    // reload++;
    // videoPlayerController!.play();
    // videoPlayerController!.setVolume(0);

    // composition = NetworkLottie(
    //         )
    //     .load();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController?.dispose();
  }
}
