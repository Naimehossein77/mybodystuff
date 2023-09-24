import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Utils/routes.dart';

class HomePageController extends GetxController {
  late final YoutubePlayerController youtubePlayerController;

  gotoProductListPage() {
    Get.toNamed(Routes.productReviewPage);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    youtubePlayerController = YoutubePlayerController(
      // initialVideoId: 'N-Z8eCYZod8',
      initialVideoId: YoutubePlayer.convertUrlToId(
              Get.arguments??'') ??
          '',
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    youtubePlayerController.dispose();
  }
}
