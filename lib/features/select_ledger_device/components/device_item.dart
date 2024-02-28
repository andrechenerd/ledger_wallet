// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/core/ui_components/others/app_button.dart';
import 'package:ledger/features/select_ledger_device/detail_ledger/screen.dart';

class DeviceItem extends StatefulWidget {
  const DeviceItem({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String name;
  final String image;
  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        width: double.maxFinite,
        height: double.maxFinite,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.grey : AppColors.darkGrey,
          border: _isHovered
              ? const Border.symmetric(
                  vertical: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                )
              : null,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 11,
            ),
            Image.asset(
              widget.image,
              width: 62,
              height: 300,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isHovered ? 70 : 60,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            if (_isHovered)
              AppButton(
                bgColor: AppColors.white,
                text: "Select",
                textColor: AppColors.anotherBlack,
                width: 105,
                height: 46,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailLedgerScreen(deviceName: widget.name),
                    ),
                  );
                },
              ).onlyPadding(t: 20),
            const Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
