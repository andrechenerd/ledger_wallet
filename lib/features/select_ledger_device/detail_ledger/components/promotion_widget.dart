// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_icons.dart';
import 'package:ledger/core/extensions/mediaquery_extensions.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({
    Key? key,
    required this.title,
    required this.cardImage,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.onPromotionSelect,
    required this.cardImageHeight,
  }) : super(key: key);
  final String title;
  final String cardImage;
  final String cardTitle;
  final String cardSubtitle;
  final VoidCallback onPromotionSelect;
  final double cardImageHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: 'DM Mono',
          ),
        ).expanded(flex: 10),
        const Spacer(),
        Container(
          width: 348,
          height: 480,
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
          ),
          child: Column(
            children: [
              Image.asset(
                cardImage,
                height: cardImageHeight,
              ),
              const Spacer(),
              Text(
                cardTitle.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ).align(
                alignment: Alignment.centerLeft,
              ),
              Text(
                cardSubtitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ).onlyPadding(t: 14, b: 26).align(
                    alignment: Alignment.centerLeft,
                  ),
              GestureDetector(
                onTap: onPromotionSelect,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppIcons.arrowRight,
                    width: 28,
                    height: 28,
                    color: AppColors.darkGrey,
                  ),
                ),
              ).onlyPadding(r: 16).align(alignment: Alignment.centerRight),
            ],
          ),
        ),
      ],
    ).onlyPadding(l: context.screenW / 8.53, r: context.screenW / 5.765);
  }
}
