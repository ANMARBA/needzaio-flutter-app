import 'package:intl/intl.dart';

class TimeConvert {
  final dateFormatter = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  static DateTime fromGraphQLTimestamptzToDartDateTime(String timestamptz) =>
      DateTime.parse(timestamptz);

  String fromDartDateTimeToGraphQLTimestamptz(DateTime timestamptz) =>
      dateFormatter.format(timestamptz);
}
