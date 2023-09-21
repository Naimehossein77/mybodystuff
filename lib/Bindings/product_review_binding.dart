import 'package:get/get.dart';
import 'package:mybodystuff/View/product_review_page.dart';

import '../Controller/loginpage_controller.dart';
import '../Controller/product_review_controller.dart';

class ProductReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductReviewController());
  }
}
