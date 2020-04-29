import 'dart:async';

import 'package:greeter/core/result.dart';
import 'package:greeter/core/view_model.dart';
import 'package:greeter/factories/greetee_factory.dart';
import 'package:greeter/models/greetee.dart';
import 'package:greeter/models/greeting.dart';
import 'package:greeter/services/greeter_service.dart';
import 'package:greeter/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

class GreeterViewModel extends ViewModel {
  GreeterViewModel(this.greeterService);

  // - Dependencies

  final GreeterService greeterService;

  // - Inputs

  Sink<bool> get greetEvent => _greetEvent;
  final _greetEvent = PublishSubject<bool>();

  Sink<String> get name => _name;
  final _name = BehaviorSubject<String>.seeded(null);

  // - Outputs

  ValueStream<Result<Greeting>> get greeting => _greeting;
  final _greeting = BehaviorSubject<Result<Greeting>>();

  // - Lifecycle

  @override
  void init() {
    _greetEvent.exhaustMap(_doOnGreet).bindTo(_greeting, addTo: subscriptions);
  }

  // - Business Logic

  Stream<Result<Greeting>> _doOnGreet(bool greet) {
    if (greet) {
      return _getGreeting();
    } else {
      return Stream.value(null);
    }
  }

  Stream<Result<Greeting>> _getGreeting() {
    return _getGreetee().switchMap(greeterService.greet).toResult();
  }

  Stream<Greetee> _getGreetee() {
    return _name.map(GreeteeFactory.fromName).firstAsStream();
  }
}
