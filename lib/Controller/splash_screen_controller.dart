import 'dart:developer';
import 'package:get/get.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/routes.dart';
import 'package:mybodystuff/Utils/utils.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  VideoPlayerController? videoPlayerController;
  String prodId = '1';
  @override
  void onInit() async {
    //TODO: FOR TEST ONLY
    // FirebaseRepo().saveProduct(ProductModel(
    //     deviceId: await getDeviceId(),
    //     prodId: prodId,
    //     prodName: 'Test product',
    //     prodSerialNumber: '100'));
    if (Get.arguments != null) prodId = Get.arguments;
    log('DeviceId: ${await getDeviceId()}');
    String youtubeVideoUrl = await FirebaseRepo().getYoutubeVideoLink();
    await _initializeVideoPlayer();
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      if (Get.arguments != null) {
        Get.back();
      } else {
        Get.offAllNamed(Routes.homePageRoute, arguments: youtubeVideoUrl);
      }
    });
  }

  Future<void> _initializeVideoPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/$prodId.mp4');
    await videoPlayerController!.initialize();
    reload++;
    videoPlayerController!.play();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController?.dispose();
  }
}
