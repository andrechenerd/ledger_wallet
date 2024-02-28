import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger/data/apis/wallet_api.dart';
import 'package:ledger/features/wallet_connection/state.dart';

class WalletConnectionScreenCubit extends Cubit<WalletConnectionScreenState> {
  WalletConnectionScreenCubit() : super(WalletConnectionScreenState.initial());

  String phrase = "";

  void nextStep() {
    emit(state.copyWith(currentStepIndex: min(state.currentStepIndex + 1, 4)));
  }

  void prevStep() {
    emit(state.copyWith(currentStepIndex: max(state.currentStepIndex - 1, 0)));
  }

  void setRecoveryPhrase(String text) {
    phrase = text;
  }
}
