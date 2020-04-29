import 'package:greeter/models/greetee.dart';
import 'package:greeter/utils/id_generator.dart';

class GreeteeFactory {
  static Greetee fromName(String name) {
    if (name == null || name.isEmpty) {
      throw 'Name not set.';
    }

    return Greetee((b) => b
      ..id = IdGenerator().generateId()
      ..name = name);
  }
}
