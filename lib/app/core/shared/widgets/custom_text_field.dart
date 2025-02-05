import 'package:flutter/material.dart';

class CustomTextField {
  TextFormField generalForm(
      String label,
      IconData prefixIcon,
      TextInputType inputType,
      bool enable,
      TextEditingController controller,
      bool isRequired) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          enabled: enable,
          prefixIcon: Icon(prefixIcon),
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      validator: (value) {
        if (value == '' && isRequired) {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }

  TextFormField passwordForm(String label, IconData prefixIcon,
      IconData suffixIcon, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      validator: (value) {
        if (value == '') {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }

  TextFormField optionForm(String label, bool isEnable, VoidCallback onTap,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: true,
      decoration: InputDecoration(
          enabled: isEnable,
          suffixIcon: const Icon(Icons.arrow_drop_down),
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      validator: (value) {
        if (value == '') {
          return '$label masih kosong!';
        }
        return null;
      },
    );
  }
}
