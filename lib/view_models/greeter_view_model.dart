import 'dart:async';
import 'package:greeter/core/view_model.dart';
import 'package:greeter/services/greeter_service.dart';

class GreeterViewModel extends ViewModel {
  final GreeterService greeterService;
  GreeterViewModel(this.greeterService);

  String greetingMessage;

  Future getGreeting(String name) async {
    setState(ViewState.Busy);
    greetingMessage = await greeterService.greet(name);
    setState(ViewState.Idle);
  }
}
