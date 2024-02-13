import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

/// Implementation of [HomeRepository]
@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  /// Constructor
  const HomeRepositoryImpl(this._homeRemoteService);

  final HomeRemoteService _homeRemoteService;

  @override
  Future<Either<CommonFailure, List<BoardingPass>>> getBoardingPasses() async {
    final result = await _homeRemoteService.getBoardingPasses();
    return right(result.toDomain());
  }

  @override
  Future<Either<CommonFailure, BoardingPass>> addBoardingPass(
    BoardingPass boardingPass,
  ) async {
    final result =
        await _homeRemoteService.addBoardingPass(boardingPass.toDTO());
    return right(result.toDomain());
  }
}
