// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ledger/core/constants/app_colors.dart';
import 'package:ledger/core/constants/app_images.dart';
import 'package:ledger/core/extensions/widget_extensions.dart';
import 'package:ledger/features/select_ledger_device/components/app_bar.dart';
import 'package:ledger/features/select_ledger_device/detail_ledger/components/promotion_widget.dart';
import 'package:ledger/features/wallet_connection/screen.dart';

class DetailLedgerScreen extends StatefulWidget {
  const DetailLedgerScreen({
    Key? key,
    required this.deviceName,
  }) : super(key: key);
  final String deviceName;
  @override
  State<DetailLedgerScreen> createState() => _DetailLedgerScreenState();
}

class _DetailLedgerScreenState extends State<DetailLedgerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            const SelectLedgerDeviceScreenAppBar(isWithSubtitle: false),
            ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                PromotionWidget(
                  title: "First time using\nyour nano s plus?",
                  cardImage: AppImages.promotion1,
                  cardTitle: "Setup a new ${widget.deviceName}",
                  cardSubtitle: "Let’s start and set up your device",
                  onPromotionSelect: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const WalletConnectionScreenBuilder(),
                      ),
                    );
                  },
                  cardImageHeight: 265,
                ).onlyPadding(t: 10),
                Container(
                  width: double.maxFinite,
                  height: 1,
                  color: AppColors.grey,
                ).symmetricPadding(vertical: 60),
                PromotionWidget(
                  title: "Already have a\nrecovery phrase?",
                  cardImage: AppImages.promotion2,
                  cardTitle: "restore your recovery phrase on a new device",
                  cardSubtitle:
                      "Use an existing recovery phrase to restore your privet keys on a new Nano!",
                  onPromotionSelect: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const WalletConnectionScreenBuilder(),
                      ),
                    );
                  },
                  cardImageHeight: 265,
                ).onlyPadding(t: 10, b: 165),
              ],
            ).expanded(),
          ],
        ),
      ),
    );
  }
}
