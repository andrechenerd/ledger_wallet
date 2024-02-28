import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ledger/app/app.dart';
import 'package:window_size/window_size.dart';

void main() {
  if (Platform.isLinux) {
    setWindowTitle('Ledger Wallet');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1280, 720));
  }
  runApp(LedgerApp());
}
