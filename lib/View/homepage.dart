import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybodystuff/Controller/homepage_controller.dart';
import 'package:mybodystuff/Utils/toastUtils.dart';
import 'package:mybodystuff/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
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
        drawer: Drawer(
          surfaceTintColor: Colors.white,
          backgroundColor: kscaffoldBackgroundColor,
          child: SafeArea(
            child: Column(children: [
              height(20.h),
              InkWell(
                onTap: () {
                  controller.gotoProductListPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(.01),
                        Colors.white.withOpacity(.1),
                        Colors.white.withOpacity(.01),
                      ], stops: const [
                        .1,
                        .6,
                        1
                      ]),
                      color: Colors.white),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.list_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                        width(15.w),
                        Text(
                          'Your Products',
                          style: kPoppinsTextStyle.copyWith(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: YoutubePlayer(
                        controller: controller.youtubePlayerController),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'UNSTOPPABLE 1.0',
                    style: kPoppinsTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    textAlign: TextAlign.justify,
                    style: kPoppinsTextStyle.copyWith(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
