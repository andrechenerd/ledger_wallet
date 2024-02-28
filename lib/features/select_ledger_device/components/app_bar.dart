import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/mediaquery_extensions.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/features/select_ledger_device/components/language_dropdown.dart';
import 'package:ledger/features/select_ledger_device/components/previus_button.dart';

class SelectLedgerDeviceScreenAppBar extends StatelessWidget {
  const SelectLedgerDeviceScreenAppBar(
      {super.key, required this.isWithSubtitle});
  final bool isWithSubtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const PreviusButton(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.logo,
              width: 105,
              height: 37,
            ),
            if (isWithSubtitle)
              const Text(
                "WHAT’S YOUR LEDGER?",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontFamily: "DM Mono",
                ),
              ).onlyPadding(t: context.screenH / 11.8),
          ],
        ),
        const LanguageDropdown(),
      ],
    ).allPadding(60);
  }
}
