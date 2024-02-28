import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';
import 'package:ledger/features/wallet_connection/steps/step_2/components/switcher.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late final WalletConnectionScreenCubit cubit;
  bool _isTurned = false;
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
          "Your recovery phrase is the secret list of words that you backed up when\nyou first set up your wallet.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ).onlyPadding(b: 12),
        const Text(
          "Ledger does not keep a copy of your recovery phrase.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ).onlyPadding(b: 60),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 20, 60, 20),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              LedgerSwitcher(
                onChange: (p0) {
                  _isTurned = p0;
                  setState(() {});
                },
                initialValue: false,
              ).onlyPadding(r: 25),
              const Text(
                "I understand that if I lose my recovery phrase, I will not be able to access my crypto in case I lose access to my Nano.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ).onlyPadding(r: 40),
        const Spacer(),
        Row(
          children: [
            AppButton(
              bgColor: AppColors.transparent,
              text: "Back",
              textColor: AppColors.white,
              onTap: () {
                cubit.prevStep();
              },
              borderColor: AppColors.white,
            ).expanded(flex: 7),
            const Spacer(
              flex: 11,
            ),
            AppButton(
              bgColor: _isTurned ? AppColors.white : AppColors.grey,
              text: "Enter recovery phrase",
              icon: AppIcons.arrowRight,
              textColor:
                  _isTurned ? AppColors.anotherBlack : AppColors.lightGrey,
              onTap: () {
                if (!_isTurned) return;
                cubit.nextStep();
              },
            ).expanded(flex: 15),
          ],
        ),
      ],
    );
  }
}
