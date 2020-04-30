import 'dart:async';
import 'package:greeter/core/view_model.dart';
import 'package:greeter/services/greeter_service.dart';

class GreeterViewModel extends ViewModel {
  final GreeterService greeterService;
  GreeterViewModel(this.greeterService);

  StreamController<String> greetingMessageController =
      StreamController<String>();

  Future getGreeting(String name) async {
    String greetingMessage = await greeterService.greet(name);
    greetingMessageController.add(greetingMessage);
  }

  void clear() {
    greetingMessageController.add('');
  }
}
