// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.number,
    required this.title,
    this.subtitle,
  }) : super(key: key);
  final int number;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ).onlyPadding(r: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
              ).onlyPadding(t: 3),
          ],
        ).expanded(),
      ],
    );
  }
}
