import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/dialogs/secure_your_pin_code.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';
import 'package:ledger/features/wallet_connection/steps/step_3/components/info_widget.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
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
          "recovery phrase".toUpperCase(),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: 'DM Mono',
          ),
        ).onlyPadding(b: 60),
        const InfoWidget(
          number: 1,
          title: "Grab your recovery phrase",
        ).onlyPadding(b: 24),
        const InfoWidget(
          number: 2,
          title: "Select recovery phrase legth",
          subtitle:
              "Your recovery phrases can have 12,18 or 24 words. You must enter all words to access your crypto.",
        ),
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
              flex: 15,
            ),
            AppButton(
              bgColor: AppColors.white,
              text: "Next step",
              icon: AppIcons.arrowRight,
              textColor: AppColors.anotherBlack,
              onTap: () {
                showSecureYourPinCodeDialog(
                  context,
                  onAction: () {
                    cubit.nextStep();
                  },
                );
              },
            ).expanded(flex: 11),
          ],
        ),
      ],
    );
  }
}
