import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/features/select_ledger_device/screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Row(
          children: [
            Container(
              height: double.maxFinite,
              color: AppColors.darkGrey,
              child: Row(
                children: [
                  const Spacer(
                    flex: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 6),
                      Image.asset(
                        AppImages.logo,
                        width: 155,
                        height: 32,
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                      const Text(
                        "The most Secure\nCryptocurrency &\nNFT Wallet",
                        style: TextStyle(
                          fontFamily: "DM Mono",
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          height: 1.4,
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      const Text(
                        "Securely manage, buy and grow your crypto\nand NFTs on Ledger Live.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 21,
                      ),
                      AppButton(
                        bgColor: AppColors.white,
                        text: "Get started",
                        textColor: AppColors.darkGrey,
                        icon: AppIcons.arrowRight,
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SelectLedgerDeviceScreen(),
                            ),
                          );
                        },
                      ).onlyPadding(b: 16),
                      AppButton(
                        bgColor: AppColors.transparent,
                        text: "No device? Buy a Ledger Nano X",
                        textColor: AppColors.white,
                        borderColor: AppColors.white,
                        onTap: () {},
                      ).onlyPadding(b: 20),
                      const Text.rich(
                        TextSpan(
                          text:
                              "By tapping “Get Started” you consent and agree to our ",
                          children: [
                            TextSpan(
                              text: "Terms and conditions",
                              style: TextStyle(color: AppColors.lightPurple),
                            ),
                            TextSpan(
                              text: " and ",
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: AppColors.lightPurple),
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(
                        flex: 8,
                      )
                    ],
                  ).expanded(flex: 83),
                  const Spacer(
                    flex: 13,
                  ),
                ],
              ),
            ).expanded(flex: 24),
            Image.asset(
              AppImages.welcomeBg,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ).expanded(flex: 40),
          ],
        ),
      ),
    );
  }
}
