import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class PreviusButton extends StatelessWidget {
  const PreviusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: AppColors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppIcons.arrowLeft,
              width: 28,
              height: 28,
              color: AppColors.white,
            ),
            const Text(
              "Previus",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ).onlyPadding(l: 6),
          ],
        ),
      ),
    );
  }
}
