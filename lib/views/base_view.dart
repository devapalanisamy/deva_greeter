import 'package:flutter/material.dart';
import 'package:greeter/core/view_model.dart';
import 'package:greeter/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ViewModel> extends StatefulWidget {
  const BaseView({this.builder, this.setupViewModel});
  final Widget Function(BuildContext context, T viewModel, Widget child)
      builder;
  final Function(T) setupViewModel;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ViewModel> extends State<BaseView<T>> {
  T viewModel = locator<T>();

  @override
  void initState() {
    if (widget.setupViewModel != null) {
      widget.setupViewModel(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
