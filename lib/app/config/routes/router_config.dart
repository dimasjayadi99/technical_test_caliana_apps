import 'package:get/get.dart';
import 'package:my_caliana_apps/app/core/constant/path.dart';
import 'package:my_caliana_apps/app/presentation/pages/check_in_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/login_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/pra_registration_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/registration_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/splash_screen_page.dart';
import 'package:my_caliana_apps/main.dart';

class MyRouterConfig {
  List<GetPage> listPages = [
    GetPage(
        name: PathConstant.splashScreen, page: () => const SplashScreenPage()),
    GetPage(name: PathConstant.login, page: () => LoginPage()),
    GetPage(
        name: PathConstant.main, page: () => const CustomBottomNavigation()),
    GetPage(name: PathConstant.registration, page: () => RegistrationPage()),
    GetPage(
        name: PathConstant.praRegistration, page: () => PraRegistrationPage()),
    GetPage(name: PathConstant.checkIn, page: () => const CheckInPage()),
  ];
}
