import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

class GetBoardingPassNotifier extends StateNotifier<GetBoardingPassState> {
  GetBoardingPassNotifier(
    this._getBoardingPassUseCase,
  ) : super(const GetBoardingPassState.initial());

  final GetBoardingPassUseCase _getBoardingPassUseCase;

  Future<void> execute() async {
    state = const GetBoardingPassState.loading();
    final fold = await _getBoardingPassUseCase.execute();
    fold.fold(
      (failure) => state = GetBoardingPassState.error(failure: failure),
      (data) => state = GetBoardingPassState.data(boardingPasses: data),
    );
  }
}
