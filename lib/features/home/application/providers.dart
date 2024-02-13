import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_needzaio_app/core/core.dart';
import 'package:flutter_needzaio_app/features/home/home.dart';

final getBoardingPassNotifierProvider =
    StateNotifierProvider<GetBoardingPassNotifier, GetBoardingPassState>(
  (ref) => GetBoardingPassNotifier(getIt<GetBoardingPassUseCase>()),
);

final addBoardingPassNotifierProvider =
    StateNotifierProvider<AddBoardingPassNotifier, AddBoardingPassState>(
  (ref) => AddBoardingPassNotifier(getIt<AddBoardingPassUseCase>()),
);
