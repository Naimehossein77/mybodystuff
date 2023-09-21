import 'package:get/get.dart';
import '../Controller/product_review_controller.dart';

class ProductReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductReviewController());
  }
}
