import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late Size size = Size(0, 0);
double zoom = 15;

final Color kblack = Colors.black;
final Color kwhite = Colors.white;
final Color kamber = Colors.amber;
final Color kred = Colors.red;
final Color kgrey = Colors.grey;
final Color kblue = Colors.blue;
final Color ktransparent = Colors.transparent;
final Color kOnboardingColors = Color(0xff0047C3);
final Color ktextFieldColor = Color(0xffEEEEEE);
final Color kscaffoldBackgroundColor = Color(0xFF1A1E21);
final Color kscaffoldBackgroundColor2 = Color(0xfff0f1f6);
final Color kDefaultHomePageBackgroundColor = Color(0xffF0F1F6);
final Color kBusyColor = Color(0xffF9E4D5);
final Color kBusyBorderColor = Color(0xffE37A2D);

//appStrings
final String kAppName = 'Freelancer app';
final String kLoading = 'Loading...';
//login-screen
final String kLoginSkipButton = 'skip';
final String kLoginJoinGoec = 'Join GO EC and make';
final String kLoginRevolutions = 'Revolutions';

final String kLoginButtonGoogle = 'Google';
final String kLoginButtonFacebook = 'Facebook';
final String kLoginButtonPhone = 'Login with Phone';
final String kLoginTermsAndPrivay = 'Login with Phone';
final String kAll = 'All';
final String kAvailable = 'Available';
final String kUnavailable = 'Unavailable';
final String kFaulted = 'Faulted';
final String kBusy = 'Busy';

late BuildContext kContext;

final TextStyle kPoppinsTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontSize: 22,
);

final TextStyle kAppSmallTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xff828282),
);
final TextStyle kAppSuperSmallTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 10,
  fontWeight: FontWeight.w400,
  color: Color(0xff828282),
);

final TextStyle kApphintTextStyle = TextStyle(
  fontFamily: "Poppins",
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color(0xffBDBDBD),
);
final TextStyle kApphintTextStyle2 = TextStyle(
  fontFamily: "Poppins",
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(251, 105, 105, 105),
);

kLog(String value) {
  log(value);
}

class Const {
  //time slot page

  static Color titleColor = const Color(0xff4B4B4B);
  static Color subTitleColor = const Color(0xff494949);
  static Color hashTagTextColor = const Color(0xffF1673B);
  static Color cardBorderColor = const Color(0xffC7C7C7);
  static Color cardBorderActiveColor = const Color(0xff579A35);

  static Color availableTextColor = const Color(0xff7AC368);
  static Color notAvailableTextColor = Color.fromARGB(255, 205, 57, 43);
  static Color activeCardBgColor = const Color(0xffF1FFEA);

  static Color activeCardTimeColor = const Color(0xff579A35);
  static Color inactiveDateTextColor = const Color(0xff828282);
  static Color inactiveDateBgtColor = Color(0xFFE2E2E2);

  static Color activeDateTextColor = const Color(0xffFF8C68);
  static Color activeDateBgtColor = const Color(0xffFF8C68).withOpacity(0.15);
}
