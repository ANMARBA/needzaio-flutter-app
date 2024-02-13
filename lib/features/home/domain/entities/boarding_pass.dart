import 'package:freezed_annotation/freezed_annotation.dart';

part 'boarding_pass.freezed.dart';

@freezed
class BoardingPass with _$BoardingPass {
  // Empty constructor
  const BoardingPass._();

  const factory BoardingPass({
    required String arrivalTime,
    required String airport,
    required double age,
    required String departureTime,
    required String email,
    required String flight,
    required String lastName,
    required String name,
  }) = _BoardingPass;
}
