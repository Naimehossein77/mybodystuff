import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybodystuff/Controller/splash_screen_controller.dart';
import 'package:video_player/video_player.dart';


class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030103),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(0.0 * controller.reload.value),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Image.asset(
                    'assets/images/Brand.png',
                    width: 200.w,
                  ),
                ),
                // height(15.h),
                // Image.asset('assets/images/1.png')
                //     .animate()
                //     .scale()
                //     .fadeIn(duration: const Duration(seconds: 1))
                //     .shake(delay: const Duration(seconds: 1)),
                Expanded(
                  child: Obx(
                    () => Container(
                      // height: 600.h,
                      padding: EdgeInsets.all(controller.reload.value * 0),
                      child: controller.videoPlayerController != null
                          ? AspectRatio(
                              aspectRatio: controller.videoPlayerController!
                                      .value.aspectRatio *
                                  1.1,
                              child: VideoPlayer(
                                  controller.videoPlayerController!),
                            )
                          : Container(),
                    ),
                  ),
                ),
                // height(15.h),
                Text(
                  controller.prodName.value,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                )
                    .animate(autoPlay: true)
                    .shimmer(
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    )
                    .shimmer(
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    )
                    .shimmer(
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    )
                // slideX(duration: const Duration(seconds: 3)),
                ,
                Text(
                  'NUMBER. ${controller.prodSerialNumber.value}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                  ),
                )
                    .animate(autoPlay: true)
                    .shimmer(
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    )
                    .shimmer(
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    )
                    .shimmer(
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      color: Colors.black,
                    ),
              ],
            )),
      ),
    );
  }
}
