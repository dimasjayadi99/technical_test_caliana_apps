import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../core/constant/style.dart';
import '../../core/shared/widgets/custom_button.dart';
import '../../core/shared/widgets/custom_text_field.dart';
import '../../core/utils/space_extension.dart';
import '../../core/constant/path.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  final List<String> imageSlider = [
    PathConstant.illustration1Path,
    PathConstant.illustration2Path,
    PathConstant.illustration3Path
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Column(
              children: [
                if (!isKeyboardVisible)
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 400.0, viewportFraction: 1.1, autoPlay: true),
                    items: imageSlider.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                i,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                24.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          8.verticalSpace,
                          CustomTextField().generalForm(
                              'example@caliana.id',
                              Icons.email,
                              TextInputType.emailAddress,
                              true,
                              emailController,
                              true),
                          32.verticalSpace,
                          const Text('Kata Sandi',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          8.verticalSpace,
                          CustomTextField().passwordForm(
                            'Masukan Kata Sandi Anda',
                            Icons.lock,
                            Icons.visibility_off,
                            passwordController,
                          ),
                          32.verticalSpace,
                          const Text(
                            'Lupa kata sandi?',
                            style: TextStyle(
                                color: StyleConstant.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                decorationThickness: 2.0,
                                fontSize: 16),
                          ),
                          const Spacer(),
                          CustomButton().fillButton(context, 'Masuk', () {
                            if (formKey.currentState!.validate()) {
                              Get.offNamedUntil(
                                  PathConstant.main, (route) => false);
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
