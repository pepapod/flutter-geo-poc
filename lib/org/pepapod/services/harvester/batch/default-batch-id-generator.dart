import 'package:flutter_geo_poc/org/pepapod/core/string/generator/random-string-generator.dart';
import 'package:flutter_geo_poc/org/pepapod/core/time/batch-id-date-formatter.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';
import 'package:intl/intl.dart';

const int RANDOM_LENGTH = 3;

class DefaultBatchIDGenerator implements BatchIDGenerator {
  static final DateFormat dateFormat = DateFormat("yyyyMMdd-S");

  static BatchIDGenerator _instance;

  DefaultBatchIDGenerator._();

  factory DefaultBatchIDGenerator.instance() {
    if (_instance == null) {
      _instance = DefaultBatchIDGenerator._();
    }
    return _instance;
  }

  @override
  String generate() {
    String datePart = BatchIDDateFormatter().format(DateTime.now());
    String randomPart = RandomStringGenerator().generate(RANDOM_LENGTH);
    return "$datePart-$randomPart";
  }
}
