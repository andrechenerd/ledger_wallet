// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StepModel extends Equatable {
  final int step;
  final String image;
  final Widget stepWidget;
  final String? bottomText;
  const StepModel({
    required this.step,
    required this.image,
    required this.stepWidget,
    this.bottomText,
  });

  @override
  List<Object?> get props => [step, image, stepWidget, bottomText];
}
