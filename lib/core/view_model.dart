import 'package:greeter/core/result.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class ViewModel {
  final subscriptions = CompositeSubscription();

  void init() {}

  @mustCallSuper
  void dispose() {
    subscriptions.dispose();
  }
}
