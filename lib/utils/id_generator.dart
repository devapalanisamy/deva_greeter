import 'dart:convert';
import 'dart:math';

class IdGenerator {
  static final _random = Random();

  String generateId([int length = 8]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
}
