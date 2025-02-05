import 'package:flutter/material.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_button.dart';
import 'package:my_caliana_apps/app/core/utils/space_extension.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfirmasi Data"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: const Text(
                  "Data Pribadi",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  _buildDataField(
                    enable: true,
                    label: "Nama",
                    icon: Icons.person_outline,
                    value: "test",
                  ),
                  const SizedBox(height: 16),
                  _buildDataField(
                    enable: true,
                    label: "Email",
                    icon: Icons.email_outlined,
                    value: "test@gmail.com",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ExpansionTile(
                title: const Text(
                  "Tujuan Kunjungan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                collapsedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                children: [
                  _buildDataField(
                    enable: false,
                    label: "Berapa banyak orang yang bersama Anda?",
                    icon: Icons.star_border,
                    value: "1",
                  ),
                ],
              ),
              const Spacer(),
              // Tombol Check In dan Batal
              CustomButton().fillButton(context, 'Check In', () {}),
              8.verticalSpace,
              CustomButton().outlineButton(context, 'Batal', () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataField({
    required String label,
    required IconData icon,
    required String value,
    required bool enable,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            readOnly: enable,
            initialValue: value,
            decoration: InputDecoration(
              hintText: value,
              prefixIcon: Icon(icon),
            ),
          )
        ],
      ),
    );
  }
}
