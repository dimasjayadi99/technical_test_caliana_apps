import 'package:flutter/material.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_button.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_text_field.dart';
import 'package:my_caliana_apps/app/core/utils/space_extension.dart';

import '../../core/utils/confirm_back_dialog.dart';

class PraRegistrationPage extends StatelessWidget {
  PraRegistrationPage({super.key});

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController waktuController = TextEditingController();

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
                    16.verticalSpace,
                    Text(
                      'Tanggal Kunjungan*',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.verticalSpace,
                    CustomTextField().generalForm(
                        'Pilih Tanggal Kunjungan*',
                        Icons.date_range,
                        TextInputType.datetime,
                        true,
                        tanggalController,
                        true),
                    16.verticalSpace,
                    Text(
                      'Waktu Kunjungan*',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    8.verticalSpace,
                    CustomTextField().generalForm(
                        'Pilih Waktu Kunjungan*',
                        Icons.access_time,
                        TextInputType.datetime,
                        true,
                        waktuController,
                        true),
                    32.verticalSpace,
                    CustomButton().fillButton(context, 'Kirim Undangan', () {}),
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
    );
  }
}
