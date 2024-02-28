import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';

Future<void> showSecureYourPinCodeDialog(
  BuildContext context, {
  required VoidCallback onAction,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SecureYourPinCodeDialog(
        onAction: onAction,
      );
    },
  );
}

class SecureYourPinCodeDialog extends StatelessWidget {
  const SecureYourPinCodeDialog({super.key, required this.onAction});
  final VoidCallback onAction;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: double.maxFinite,
        child: Row(
          children: [
            const Spacer(),
            Container(
              width: 460,
              height: double.maxFinite,
              color: AppColors.darkGrey,
              padding: const EdgeInsets.only(left: 50, right: 36),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    "Secure your pin\ncode".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ).onlyPadding(b: 18, t: 122),
                  const Text(
                    "During the setup process you choose a PIN code.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ).onlyPadding(b: 56),
                  _item(
                    icon: AppIcons.arrowRight,
                    text: "Always choose a PIN code yourself.",
                    textColor: AppColors.white,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.arrowRight,
                    text: "Always enter your PIN code if needed. ",
                    textColor: AppColors.white,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.arrowRight,
                    text: "You can change your PIN code if needed",
                    textColor: AppColors.white,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.arrowRight,
                    text:
                        "Three wrong PIN code entries in a row will rest the device.",
                    textColor: AppColors.white,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.close,
                    text:
                        "Never use an easy PIN code like 0000, 123456, or 55555555",
                    textColor: AppColors.lightPurple,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.close,
                    text:
                        "Never share your PIN code with someone else. Not even with Ledger.",
                    textColor: AppColors.lightPurple,
                  ).onlyPadding(b: 22),
                  _item(
                    icon: AppIcons.close,
                    text: "Never use a PIN code you did",
                    textColor: AppColors.lightPurple,
                  ).onlyPadding(b: 88),
                  AppButton(
                    bgColor: AppColors.white,
                    text: "Get started",
                    icon: AppIcons.arrowRight,
                    textColor: AppColors.anotherBlack,
                    width: 233,
                    onTap: () {
                      Navigator.pop(context);
                      onAction();
                    },
                  ).onlyPadding(b: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({
    required String icon,
    required String text,
    required Color textColor,
  }) {
    return Row(
      children: [
        Container(
          width: 41,
          height: 41,
          decoration: BoxDecoration(
            color: AppColors.lightPurple.withOpacity(.1),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            icon,
            width: 28,
            height: 28,
            color: AppColors.lightPurple,
          ),
        ).onlyPadding(r: 13),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ).expanded(),
      ],
    );
  }
}
