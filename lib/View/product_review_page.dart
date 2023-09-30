import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybodystuff/Utils/toastUtils.dart';

import '../Controller/product_review_controller.dart';
import '../constants.dart';

class ProductReviewPage extends GetView<ProductReviewController> {
  const ProductReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: kscaffoldBackgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Brand.png',
          width: 200.w,
        ),
        centerTitle: true,
        backgroundColor: kscaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(
        () => controller.modelList.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Text(
                  'No products Found',
                  style: kPoppinsTextStyle.copyWith(
                      fontSize: 16, color: Colors.white),
                ),
              )
            : Column(children: [
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.pageController,
                    onPageChanged: (num) {
                      kLog(num.toString());
                      controller.currentPage.value = num;
                    },
                    children: controller.modelList
                        .map(
                          (e) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/${e.prodId}.png'),
                              Text(
                                e.prodName,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                e.prodSerialNumber,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      controller.modelList.length,
                      (index) => Obx(
                            () => Container(
                              height: 15.h,
                              width: 15.h,
                              margin: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == controller.currentPage.value
                                      ? Colors.white
                                      : Colors.white.withOpacity(.5)),
                            ),
                          )),
                ),
                height(30.h)
              ]),
      ),
    );
  }
}
