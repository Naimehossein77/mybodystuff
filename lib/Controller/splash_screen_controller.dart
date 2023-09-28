import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/nfc_repo.dart';
import 'package:mybodystuff/Utils/routes.dart';
import 'package:mybodystuff/constants.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  RxInt reload = 0.obs;
  VideoPlayerController? videoPlayerController;
  @override
  void onInit() async {
    String youtubeVideoUrl = await FirebaseRepo().getYoutubeVideoLink();
    // await NFCRepo().readNFC();
    await _initializeVideoPlayer();
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(Routes.homePageRoute, arguments: youtubeVideoUrl);
    });
  }

  Future<void> _initializeVideoPlayer() async {

    videoPlayerController = VideoPlayerController.asset('assets/videos/1.mp4');
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
