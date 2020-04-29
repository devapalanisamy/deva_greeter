import 'dart:async';

import 'package:greeter/core/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

extension StreamExtensions<T> on Stream<T> {
  Stream<T> firstAsStream() async* {
    yield await first;
  }

  void bindTo(Subject<T> subject, {@required CompositeSubscription addTo}) {
    listen(subject.add, onError: subject.addError).addTo(addTo);
  }
}

extension ResultStreamExtension<T> on Stream<T> {
  Stream<Result<T>> toResult() {
    return this.map((value) => Result(value)).startWith(Result.awaiting());
  }
}
