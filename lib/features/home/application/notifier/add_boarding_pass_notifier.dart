import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

class AddBoardingPassNotifier extends StateNotifier<AddBoardingPassState> {
  AddBoardingPassNotifier(
    this._getBoardingPassUseCase,
  ) : super(const AddBoardingPassState.initial());

  final AddBoardingPassUseCase _getBoardingPassUseCase;

  Future<void> execute(AddBoardingPassParams params) async {
    state = const AddBoardingPassState.loading();
    final fold = await _getBoardingPassUseCase.execute(params);
    fold.fold(
      (failure) => state = AddBoardingPassState.error(failure: failure),
      (data) => state = AddBoardingPassState.data(boardingPass: data),
    );
  }
}
