// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WalletConnectionScreenState extends Equatable {
  final int currentStepIndex;
  const WalletConnectionScreenState({
    required this.currentStepIndex,
  });
  

  WalletConnectionScreenState copyWith({
    int? currentStepIndex,
  }) {
    return WalletConnectionScreenState(
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
    );
  }

  @override
  List<Object> get props => [currentStepIndex];

  factory WalletConnectionScreenState.initial() {
    return const WalletConnectionScreenState(currentStepIndex: 0);
  }
}
