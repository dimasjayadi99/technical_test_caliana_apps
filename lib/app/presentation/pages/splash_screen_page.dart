import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caliana_apps/app/core/constant/path.dart';
import 'package:my_caliana_apps/app/core/constant/style.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    directPage();
  }

  // direct page
  void directPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamedUntil(PathConstant.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstant.primaryColor,
      body: Center(
        child: Image.asset(
          PathConstant.logoPath,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
