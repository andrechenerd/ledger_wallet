import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/features/wallet_connection/components/step_status_widget.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';
import 'package:ledger/features/wallet_connection/state.dart';
import 'package:ledger/features/wallet_connection/step_model.dart';
import 'package:ledger/features/wallet_connection/steps/step_1/step_1.dart';
import 'package:ledger/features/wallet_connection/steps/step_2/step_2.dart';
import 'package:ledger/features/wallet_connection/steps/step_3/step_3.dart';
import 'package:ledger/features/wallet_connection/steps/step_4/step_4.dart';
import 'package:ledger/features/wallet_connection/steps/step_5/step_5.dart';

class WalletConnectionScreenBuilder extends StatelessWidget {
  const WalletConnectionScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletConnectionScreenCubit(),
      child: const WalletConnectionScreen(),
    );
  }
}

class WalletConnectionScreen extends StatefulWidget {
  const WalletConnectionScreen({super.key});

  @override
  State<WalletConnectionScreen> createState() => _WalletConnectionScreenState();
}

class _WalletConnectionScreenState extends State<WalletConnectionScreen> {
  final steps = [
    const StepModel(
      step: 1,
      image: AppImages.connectionStep1,
      stepWidget: Step1(),
    ),
    const StepModel(
      step: 2,
      image: AppImages.connectionStep2,
      stepWidget: Step2(),
      bottomText: "Need help",
    ),
    const StepModel(
      step: 3,
      image: AppImages.connectionStep2,
      stepWidget: Step3(),
      bottomText:
          "Don’t know what you have to do? Get some help to close this step",
    ),
    const StepModel(
      step: 4,
      image: AppImages.connectionStep4,
      stepWidget: Step4(),
      bottomText:
          "Don’t know what you have to do? Get some help to close this step",
    ),
    const StepModel(
      step: 5,
      image: AppImages.connectionStep5,
      stepWidget: Step5(),
      bottomText:
          "Don’t know what you have to do? Get some help to close this step",
    ),
  ];

  late final WalletConnectionScreenCubit _cubit;

  @override
  void initState() {
    _cubit = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: BlocBuilder<WalletConnectionScreenCubit,
            WalletConnectionScreenState>(builder: (context, state) {
          final step = steps[state.currentStepIndex];
          return Row(
            children: [
              Container(
                height: double.maxFinite,
                color: AppColors.lightPurple,
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 155,
                      height: 32,
                    ),
                    const Spacer(
                      flex: 47,
                    ),
                    Image.asset(
                      step.image,
                    ).expanded(flex: 54),
                    const Spacer(
                      flex: 35,
                    ),
                    SizedBox(
                      height: 150,
                      child: step.bottomText == null
                          ? null
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: 2,
                                  color: AppColors.darkGrey,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "Need help?",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    Image.asset(
                                      AppIcons.circle,
                                      width: 28,
                                      height: 28,
                                    ).onlyPadding(l: 16),
                                  ],
                                ).onlyPadding(b: 9, t: 27, l: 60, r: 34),
                                Text(
                                  step.bottomText!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGrey,
                                  ),
                                ).onlyPadding(l: 60, r: 34),
                              ],
                            ),
                    ),
                  ],
                ),
              ).expanded(),
              Container(
                height: double.maxFinite,
                color: AppColors.darkGrey,
                padding: const EdgeInsets.fromLTRB(100, 48, 60, 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        StepStatusWidget(
                          currentStep: min(
                            step.step,
                            4,
                          ),
                        ).expanded(flex: 29),
                        const Spacer(
                          flex: 6,
                        )
                      ],
                    ).onlyPadding(b: 40),
                    BlocProvider.value(
                      value: _cubit,
                      child: SizedBox(
                          width: double.maxFinite, child: step.stepWidget),
                    ).expanded(),
                    
                  ],
                ),
              ).expanded(flex: 2),
            ],
          );
        }),
      ),
    );
  }
}
