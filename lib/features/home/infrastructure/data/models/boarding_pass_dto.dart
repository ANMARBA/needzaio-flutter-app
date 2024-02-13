import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'boarding_pass_dto.freezed.dart';
part 'boarding_pass_dto.g.dart';

@freezed
class BoardingPassDTO with _$BoardingPassDTO {
  /// Empty constructor
  const BoardingPassDTO._();

  /// Named constructor
  const factory BoardingPassDTO({
    required String arrivalTime,
    required String airport,
    required double age,
    required String departureTime,
    required String email,
    required String flight,
    required String lastName,
    required String name,
  }) = _BoardingPassDTO;

  /// Generates fromJson and toJson methods
  factory BoardingPassDTO.fromJson(Map<String, Object?> json) =>
      _$BoardingPassDTOFromJson(json);
}
