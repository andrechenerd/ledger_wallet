import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/data/repositories/wallet_repo.dart';
import 'package:ledger/features/wallet_connection/cubit.dart';
import 'package:ledger/features/wallet_connection/steps/step_5/components/loading_widget.dart';
import 'package:ledger/features/wallet_connection/steps/step_5/fix_screen/screen.dart';

class Step5 extends StatefulWidget {
  const Step5({super.key});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  late final WalletConnectionScreenCubit cubit;

  @override
  void initState() {
    cubit = context.read();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Timer? _timer;
  bool _isLoading = true;
  double _value = 0;
  bool _isFixVisible = false;

  void _startTimer() {
    _getWallet();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _value = min(1, _value += 0.003);
      if (_value == 1) {
        timer.cancel();
        _isLoading = false;
        Future.delayed(const Duration(seconds: 4), () {
          if (mounted) {
            setState(() {
              _isFixVisible = true;
            });
          }
        });
      }
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {});
    });
  }

  Future<void> _getWallet() async {
    try {
      await WalletRepo().importWallet(cubit.phrase);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_isLoading)
          LoadingWidget(value: _value).onlyPadding(t: 146).align()
        else ...[
          Image.asset(
            AppImages.deviceConnectAnimation,
            width: 484,
          ).onlyPadding(t: 100, b: 40).align(),
          const Text(
            "Connect and unlock your device",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ).align(),
          if (_isFixVisible)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const FixScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Having trouble connecting your device?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ).onlyPadding(r: 23),
                    const Text(
                      "Fix it",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              ).onlyPadding(t: 37),
            ).align(),
        ],
        const Spacer(),
        Row(
          children: [
            AppButton(
              width: 143,
              bgColor: AppColors.transparent,
              text: "Back",
              textColor: AppColors.white,
              onTap: () {
                cubit.prevStep();
              },
              borderColor: AppColors.white,
            ),
            const Spacer(),
            AppButton(
              width: 213,
              bgColor: AppColors.white,
              text: "Continue",
              icon: AppIcons.arrowRight,
              textColor: AppColors.anotherBlack,
              onTap: () {
                // cubit.nextStep();
              },
            ),
          ],
        ),
      ],
    );
  }
}
