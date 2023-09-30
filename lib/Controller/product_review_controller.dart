import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybodystuff/Model/productModel.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/toastUtils.dart';

class ProductReviewController extends GetxController {
  late PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  RxList<ProductModel> modelList = RxList();
  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

  getProductList() async {
    showLoading('Loading Products...');
    modelList.value = await FirebaseRepo().getProductList();
    hideLoading();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
