import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';

class PhraseTextField extends StatefulWidget {
  const PhraseTextField({
    super.key,
    required this.ctrl,
  });
  final TextEditingController ctrl;

  @override
  State<PhraseTextField> createState() => _PhraseTextFieldState();
}

class _PhraseTextFieldState extends State<PhraseTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      maxLines: 6,
      controller: widget.ctrl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
        hintText: "Recovery phrase",
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
