import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmBackDialog() {
  Get.defaultDialog(
    title: 'Pembatalan',
    content: const Center(
      child: Text(
        'Semua data tidak akan disimpan.Yakin ingin membatalkan?',
        textAlign: TextAlign.center,
      ),
    ),
    cancel: TextButton(
        onPressed: () {
          Get.back();
          Get.back();
        },
        child: const Text('Ya, Batalkan')),
    confirm: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Tidak, Kembali')),
  );
}
