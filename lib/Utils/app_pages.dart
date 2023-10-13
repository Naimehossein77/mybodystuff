import 'package:get/get.dart';
import 'package:mybodystuff/Bindings/loginpage_binding.dart';
import 'package:mybodystuff/Bindings/product_review_binding.dart';
import 'package:mybodystuff/Bindings/splash_screen_bindings.dart';
import 'package:mybodystuff/View/homepage.dart';
import 'package:mybodystuff/View/login/Feature/Login%20Screen/Login_Screen.dart';
import 'package:mybodystuff/View/product_review_page.dart';
import 'package:mybodystuff/View/splash_screen.dart';
import '../Bindings/homepage_binding.dart';
import 'routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    //HOME PAGE
    GetPage(
      name: Routes.splashpageRoute,
      binding: SplashScreenBinding(),
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homePageRoute,
      binding: HomePageBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.productReviewPage,
      binding: ProductReviewBinding(),
      page: () => const ProductReviewPage(),
    ),
    GetPage(
      name: Routes.loginpageRoute,
      binding: LoginPageBinding(),
      page: () => LoginScreen(),
    ),
  ];
}
