import 'package:intl/intl.dart';

class BatchIDDateFormatter {
  static final DateFormat dateFormat = DateFormat("yyyyMMdd-S");

  String format(DateTime dateTime) {
    return dateFormat.format(dateTime);
  }
}
