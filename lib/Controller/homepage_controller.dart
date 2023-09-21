import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Utils/routes.dart';

class HomePageController extends GetxController {
  final YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(
    initialVideoId: 'N-Z8eCYZod8',
    flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
  );
  gotoProductListPage() {
    Get.toNamed(Routes.productReviewPage);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    youtubePlayerController.dispose();
  }
}
