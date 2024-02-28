import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';

class FixScreen extends StatelessWidget {
  const FixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.fixScreenDevice,
            width: 379,
            height: 54,
          ),
          const Text(
            "Troubleshoot USB connection",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ).onlyPadding(
            t: 40,
            b: 24,
          ),
          const Text(
            "The seems to be a problem connecting to your device. Don’t worry,\nyou can try differnt solutions one by one until your device connects!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGrey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                bgColor: AppColors.transparent,
                text: "Go back",
                textColor: AppColors.white,
                onTap: () {
                  Navigator.pop(context);
                },
                width: 187,
              ),
              AppButton(
                bgColor: AppColors.lightPurple,
                text: "Let’s fix it!",
                textColor: AppColors.darkGrey,
                onTap: () {
                },
                width: 187,
              ),
            ],
          ).onlyPadding(t: 65),
        ],
      ),
    );
  }
}
