import 'package:dartz/dartz.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

abstract class HomeRepository {
  Future<Either<CommonFailure, List<BoardingPass>>> getBoardingPasses();
  Future<Either<CommonFailure, BoardingPass>> addBoardingPass(
    BoardingPass boardingPass,
  );
}
