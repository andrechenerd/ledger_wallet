// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.borderColor,
    required this.bgColor,
    required this.text,
    required this.textColor,
    this.icon,
    this.width = double.maxFinite,
    this.height = 60,
    required this.onTap,
  }) : super(key: key);
  final Color? borderColor;
  final Color bgColor;
  final String text;
  final Color textColor;
  final String? icon;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(70),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                )
              : null,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            if(icon != null)
            Image.asset(icon!,width: 28,height: 28,color: textColor,).onlyPadding(l:5),
          ],
        ),
      ),
    );
  }
}
