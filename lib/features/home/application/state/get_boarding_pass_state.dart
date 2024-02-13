import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

part 'get_boarding_pass_state.freezed.dart';

@freezed
class GetBoardingPassState with _$GetBoardingPassState {
  const GetBoardingPassState._();

  const factory GetBoardingPassState.initial() = _Initial;

  const factory GetBoardingPassState.loading() = _Loading;

  const factory GetBoardingPassState.data({
    required List<BoardingPass> boardingPasses,
  }) = _Data;

  const factory GetBoardingPassState.error({required CommonFailure failure}) =
      _Error;
}
