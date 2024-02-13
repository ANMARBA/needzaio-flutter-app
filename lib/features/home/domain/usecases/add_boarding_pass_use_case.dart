import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

@injectable
class AddBoardingPassUseCase {
  /// Constructor
  AddBoardingPassUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  /// Execution
  Future<Either<CommonFailure, BoardingPass>> execute(
    AddBoardingPassParams params,
  ) async {
    final boardingPass = BoardingPass(
      arrivalTime: params.arrivalTime,
      airport: params.airport,
      age: params.age,
      departureTime: params.departureTime,
      email: params.email,
      flight: params.flight,
      lastName: params.lastName,
      name: params.name,
    );
    return await _homeRepository.addBoardingPass(boardingPass);
  }
}

/// Params for execute method on [AddBoardingPassUseCase]
class AddBoardingPassParams {
  /// Constructor
  const AddBoardingPassParams({
    required this.arrivalTime,
    required this.airport,
    required this.age,
    required this.departureTime,
    required this.email,
    required this.flight,
    required this.lastName,
    required this.name,
  });

  final String arrivalTime;
  final String airport;
  final double age;
  final String departureTime;
  final String email;
  final String flight;
  final String lastName;
  final String name;
}
