import 'package:flutter/material.dart';
import 'package:my_caliana_apps/app/core/constant/style.dart';

class CustomButton {
  SizedBox fillButton(BuildContext context, String label, VoidCallback onTap) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: StyleConstant.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(
            color: StyleConstant.whiteColor,
          ),
        ),
      ),
    );
  }

  SizedBox outlineButton(
      BuildContext context, String label, VoidCallback onTap) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: StyleConstant.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(color: StyleConstant.primaryColor),
        ),
      ),
    );
  }
}
