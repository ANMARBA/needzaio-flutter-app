import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_failure.freezed.dart';

/// Different kind of failures that will be handled
@freezed
class CommonFailure with _$CommonFailure {
  const CommonFailure._();

  /// When something went wrong because of the data that has been sent
  const factory CommonFailure.data() = _Data;

  /// When there is no data in the response
  const factory CommonFailure.noData() = _NoData;

  /// When something went wrong in the server side
  const factory CommonFailure.server() = _Server;

  /// When there is not internet connection
  const factory CommonFailure.noConnection() = _NoConnection;

  /// When there is not authorized
  const factory CommonFailure.unauthorized() = _Unauthorized;
}
