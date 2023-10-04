import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybodystuff/Singletones/app_data.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'Utils/app_pages.dart';
import 'Utils/routes.dart';
import 'constants.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'dart:html' as html;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'mybodystuff',
    options: const FirebaseOptions(
        apiKey: "AIzaSyBu4et-Go5zNOq6_TktMk0FX7DE-xjYElQ",
        authDomain: "mybodystuff-37c0f.firebaseapp.com",
        projectId: "mybodystuff-37c0f",
        storageBucket: "mybodystuff-37c0f.appspot.com",
        messagingSenderId: "1017881543670",
        appId: "1:1017881543670:web:8c19e08836a202e5827dd7",
        measurementId: "G-X7SW21TFEQ"),
  );
  String url = html.window.location.href;
  Map<String, String> queryParams = Uri.parse(url).queryParameters;
  appData.getProdFromParamToAppData(queryParams);
  kLog(queryParams.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return GetMaterialApp(
            title: 'GOEC',
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme.apply(),
              ),
              fontFamily: 'Poppins',
              primarySwatch: Colors.grey,
              scaffoldBackgroundColor: kscaffoldBackgroundColor,
            ),
            initialRoute: Routes.splashpageRoute,
            getPages: AppPages.pages,
          );
        }));
  }
}
