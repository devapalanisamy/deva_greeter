import 'package:flutter/foundation.dart';

abstract class ViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  @override
  void dispose();
}

enum ViewState { Idle, Busy }
