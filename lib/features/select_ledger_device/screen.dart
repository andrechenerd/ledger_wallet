import 'package:flutter/material.dart';
import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/mediaquery_extensions.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/features/select_ledger_device/components/app_bar.dart';
import 'package:ledger/features/select_ledger_device/components/device_item.dart';
import 'package:ledger/features/select_ledger_device/components/language_dropdown.dart';
import 'package:ledger/features/select_ledger_device/components/previus_button.dart';

class SelectLedgerDeviceScreen extends StatefulWidget {
  const SelectLedgerDeviceScreen({super.key});

  @override
  State<SelectLedgerDeviceScreen> createState() =>
      _SelectLedgerDeviceScreenState();
}

class _SelectLedgerDeviceScreenState extends State<SelectLedgerDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: [
                  const DeviceItem(
                    image: AppImages.ledgerNanoS,
                    name: "Ledger Nano S",
                  ).expanded(),
                  const DeviceItem(
                    image: AppImages.ledgerNanoSPlus,
                    name: "Ledger Nano S Plus",
                  ).expanded(),
                  const DeviceItem(
                    image: AppImages.ledgerNanoX,
                    name: "Ledger Nano X",
                  ).expanded(),
                ],
              ),
            ),
            const SelectLedgerDeviceScreenAppBar(isWithSubtitle: true),
          ],
        ),
      ),
    );
  }
}
