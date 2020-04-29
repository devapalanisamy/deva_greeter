import 'package:greeter/models/greetee.dart';
import 'package:greeter/models/greeting.dart';
import 'package:greeter/utils/id_generator.dart';
import 'package:greeter/utils/time_utils.dart';

class GreeterService {
  GreeterService(this.idGenerator);

  final IdGenerator idGenerator;

  Stream<Greeting> greet(Greetee greetee) async* {
    print('GreeterService.greet: $greetee');

    final greeting = Greeting((b) => b
      ..id = idGenerator.generateId()
      ..value = 'Hello, ${greetee.name}!'
      ..timestamp = TimeUtils.now());

    await Future.delayed(Duration(seconds: 1));

    yield greeting;
  }
}
