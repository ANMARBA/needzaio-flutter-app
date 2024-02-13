import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

@injectable
class GetBoardingPassUseCase {
  /// Constructor
  const GetBoardingPassUseCase(
    this._homeRepository,
  );

  final HomeRepository _homeRepository;

  /// Execution
  Future<Either<CommonFailure, List<BoardingPass>>> execute() async {
    return _homeRepository.getBoardingPasses();
  }
}
