import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_button.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_text_field.dart';
import 'package:my_caliana_apps/app/core/utils/confirm_back_dialog.dart';
import 'package:my_caliana_apps/app/core/utils/space_extension.dart';
import 'package:my_caliana_apps/app/presentation/pages/check_in_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController kartuIdentitasController =
      TextEditingController();
  final TextEditingController kartuAksesController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulir Registrasi"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Data Pribadi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  24.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nomor Kartu Identitas',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      8.verticalSpace,
                      CustomTextField().generalForm(
                          'Masukan Nomor Kartu Identitas',
                          Icons.account_box_outlined,
                          TextInputType.number,
                          true,
                          kartuIdentitasController,
                          false),
                      16.verticalSpace,
                      Text(
                        'Nomor Kartu Akses',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      8.verticalSpace,
                      CustomTextField().generalForm(
                          'Masukan Nomor Kartu Akses',
                          Icons.account_box_outlined,
                          TextInputType.number,
                          true,
                          kartuAksesController,
                          false),
                      16.verticalSpace,
                      Text(
                        'Nama*',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      8.verticalSpace,
                      CustomTextField().generalForm(
                          'Nama Anda',
                          Icons.person_outline_rounded,
                          TextInputType.text,
                          true,
                          namaController,
                          true),
                      16.verticalSpace,
                      Text(
                        'Email*',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      8.verticalSpace,
                      CustomTextField().generalForm(
                          'Email Anda',
                          Icons.alternate_email,
                          TextInputType.emailAddress,
                          true,
                          emailController,
                          true),
                      32.verticalSpace,
                      CustomButton().fillButton(context, 'Selanjutnya', () {
                        if (formKey.currentState!.validate()) {
                          Get.to(const CheckInPage());
                        }
                      }),
                      8.verticalSpace,
                      CustomButton().outlineButton(context, 'Batal', () {
                        confirmBackDialog();
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
