import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybodystuff/Controller/splash_screen_controller.dart';
import 'package:mybodystuff/constants.dart';

import '../Utils/toastUtils.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kscaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(0.0 * controller.reload.value),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Image.asset('assets/images/Brand.png'),
                  ),
                  height(15.h),
                  Image.asset('assets/images/Bottle.png')
                      .animate()
                      .scale()
                      .fadeIn(duration: const Duration(seconds: 1))
                      .shake(delay: const Duration(seconds: 1)),
                  height(15.h),
                  Text(
                    'UNSTOPPABLE 1.0',
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
                    'NUMBER. 07',
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
                      )
                ],
              ),
            )),
      ),
    );
  }
}
