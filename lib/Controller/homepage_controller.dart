import 'package:get/get.dart';
import 'package:mybodystuff/Model/productModel.dart';
import 'package:mybodystuff/Singletones/app_data.dart';
import 'package:mybodystuff/Utils/nfc_repo.dart';
import 'package:mybodystuff/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../Utils/firebase_repo.dart';
import '../Utils/routes.dart';

class HomePageController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  RxInt reload = 0.obs;

  gotoProductListPage() {
    Get.toNamed(Routes.productReviewPage);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
// If the requirement is just to play a single video.
    await _initYoutubeVideoIframe();
    await _saveProductFromNFCToFirebase();
    // youtubePlayerController = YoutubePlayerController(
    //   // initialVideoId: 'N-Z8eCYZod8',
    //   initialVideoId: YoutubePlayer.convertUrlToId(Get.arguments ?? '') ?? '',
    //   flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    // );
    // await NFCRepo().readNFC();
    // kLog((await NFCRepo().isNfcSupported()).toString());
  }

  _initYoutubeVideoIframe() async {
    String youtubeVideoUrl = await FirebaseRepo().getYoutubeVideoLink();
    youtubePlayerController = YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(youtubeVideoUrl) ?? '',
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: false,
        loop: true,
        showControls: false,
      ),
    );
    reload++;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // youtubePlayerController.dispose();
    youtubePlayerController?.close();
    // NFCRep`o().stopSession();
  }

  _saveProductFromNFCToFirebase() async {
    if (appData.id.isEmpty || appData.serial.isEmpty || appData.name.isEmpty) {
      return;
    }
    var res = await FirebaseRepo().saveProduct(ProductModel(
        deviceId: FirebaseRepo().auth.currentUser?.uid ?? '',
        prodId: appData.id,
        prodName: appData.name,
        prodSerialNumber: appData.serial));
    if (res) {
      appData.id = appData.serial = appData.name = '';
    }
  }

  logout() async {
    await FirebaseRepo().logout();
    Get.toNamed(Routes.loginpageRoute);
  }
}
