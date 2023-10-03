import 'package:get/get.dart';
import 'package:mybodystuff/Utils/nfc_repo.dart';
import 'package:mybodystuff/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Utils/routes.dart';

class HomePageController extends GetxController {
  late final YoutubePlayerController youtubePlayerController;

  gotoProductListPage() {
    Get.toNamed(Routes.productReviewPage);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    youtubePlayerController = YoutubePlayerController(
      // initialVideoId: 'N-Z8eCYZod8',
      initialVideoId: YoutubePlayer.convertUrlToId(Get.arguments ?? '') ?? '',
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
    // await NFCRepo().readNFC();
    // kLog((await NFCRepo().isNfcSupported()).toString());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    youtubePlayerController.dispose();
    // NFCRep`o().stopSession();
  }
}
