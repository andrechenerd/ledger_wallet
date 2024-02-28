import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  late final WalletConnectionScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Restore from recovery phrase".toUpperCase(),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: 'DM Mono',
          ),
        ).onlyPadding(b: 60),
        const Text(
          "Restore your Nano from your recovery phrase to restore, replace or back up\nyour Ledger hardware wallet.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ).onlyPadding(b: 12),
        const Text(
          "Your Nano will restore your private keys and you will be adle to access and\nmanage your crypto.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ).onlyPadding(b: 12),
        const Spacer(),
        Row(
          children: [
            AppButton(
              bgColor: AppColors.transparent,
              text: "Back",
              textColor: AppColors.white,
              onTap: () {
                Navigator.pop(context);
              },
              borderColor: AppColors.white,
            ).expanded(flex: 7),
            const Spacer(
              flex: 11,
            ),
            AppButton(
              bgColor: AppColors.white,
              text: "Ok, I’m ready!",
              icon: AppIcons.arrowRight,
              textColor: AppColors.anotherBlack,
              onTap: () {
                cubit.nextStep();
              },
            ).expanded(flex: 15),
          ],
        ),
      ],
    );
  }
}
