import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class StepStatusWidget extends StatelessWidget {
  const StepStatusWidget({super.key, required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) {
          final isCurrent = (index + 1) == currentStep;
          return Container(
            padding:
                isCurrent ? const EdgeInsets.symmetric(horizontal: 4) : null,
            height: isCurrent ? 34 : 4,
            decoration: BoxDecoration(
              borderRadius: isCurrent ? BorderRadius.circular(4) : null,
              color: isCurrent || (index + 1) < currentStep
                  ? AppColors.white
                  : AppColors.grey,
            ),
            child: !isCurrent
                ? null
                : Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: AppColors.darkGrey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          currentStep.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _getStepText().toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.anotherBlack,
                            ),
                          ),
                        ),
                      ).symmetricPadding(horizontal: 8).expanded(),
                    ],
                  ),
          ).expanded();
        },
      ),
    );
  }

  String _getStepText() {
    switch (currentStep) {
      case 1:
        return "Get started";
      case 2:
        return "Recovery phrase";
      case 3:
        return "Recovery phrase";
      default:
        return "Connect nano";
    }
  }
}
