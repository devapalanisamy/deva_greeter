import 'package:meta/meta.dart';

class TimeUtils {
  static DateTime _now;

  static DateTime now() {
    return _now ?? DateTime.now();
  }

  @visibleForTesting
  static void setNow(DateTime now) {
    _now = now;
  }
}
