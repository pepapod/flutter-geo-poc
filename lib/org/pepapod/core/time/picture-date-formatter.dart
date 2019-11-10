import 'package:intl/intl.dart';

class PictureDateFormatter {
  static final DateFormat dateFormat = DateFormat("yyyyMMdd_hhmm_S");

  String format(DateTime dateTime) {
    return dateFormat.format(dateTime);
  }
}
