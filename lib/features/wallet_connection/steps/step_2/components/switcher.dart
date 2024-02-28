// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';

class LedgerSwitcher extends StatefulWidget {
  const LedgerSwitcher({
    Key? key,
    required this.onChange,
    required this.initialValue,
  }) : super(key: key);
  final void Function(bool) onChange;
  final bool initialValue;
  @override
  State<LedgerSwitcher> createState() => _LedgerSwitcherState();
}

class _LedgerSwitcherState extends State<LedgerSwitcher> {
  bool _value = false;
  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChange(_value);
        });
      },
      child: Container(
        color: AppColors.transparent,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              width: 64,
              height: 34,
              decoration: BoxDecoration(
                color: _value == true ? AppColors.lightPurple : AppColors.grey,
                borderRadius: BorderRadius.circular(34),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.fromLTRB(_value == true ? 33 : 3, 3, 3, 3),
            ),
          ],
        ),
      ),
    );
  }
}
