import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            color: AppColors.lightPurple,
            strokeWidth: 16,
            value: value,
          ),
        ).onlyPadding(b: 24),
        const Text(
          "Loading...",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
