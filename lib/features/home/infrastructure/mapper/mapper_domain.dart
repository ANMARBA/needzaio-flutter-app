import 'package:flutter_needzaio_app/features/home/home.dart';

/// Mapper for List<BoardingPassDTO>
extension MapperListBoardingPassDTO on List<BoardingPassDTO> {
  /// DTO to Entity
  List<BoardingPass> toDomain() => map((e) => e.toDomain()).toList();
}

/// Handle DTO to Entity process
extension MapperBoardingPassDTO on BoardingPassDTO {
  /// DTO to Entity
  BoardingPass toDomain() => BoardingPass(
        arrivalTime: arrivalTime,
        airport: airport,
        age: age,
        departureTime: departureTime,
        email: email,
        flight: flight,
        lastName: lastName,
        name: name,
      );
}

extension MapperToDo on BoardingPass {
  /// [BoardingPass] (Domain) to [BoardingPassDTO] (Infrastructure)
  BoardingPassDTO toDTO() {
    return BoardingPassDTO(
      arrivalTime: arrivalTime,
      airport: airport,
      age: age,
      departureTime: departureTime,
      email: email,
      flight: flight,
      lastName: lastName,
      name: name,
    );
  }
}
