import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

part 'add_boarding_pass_state.freezed.dart';

@freezed
class AddBoardingPassState with _$AddBoardingPassState {
  const AddBoardingPassState._();

  const factory AddBoardingPassState.initial() = _Initial;

  const factory AddBoardingPassState.loading() = _Loading;

  const factory AddBoardingPassState.data({
    required BoardingPass boardingPass,
  }) = _Data;

  const factory AddBoardingPassState.error({required CommonFailure failure}) =
      _Error;
}
