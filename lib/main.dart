import 'package:flutter/material.dart';
import 'package:greeter/core/view_model.dart';
import 'package:greeter/locator.dart';
import 'package:greeter/view_models/greeter_view_model.dart';
import 'package:greeter/views/base_view.dart';

void main() {
  setupLocator();
  runApp(GreeterApp());
}

class GreeterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greeter',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          secondary: Colors.black,
          onSecondary: Colors.white,
        ),
        primaryColor: Colors.black,
        accentColor: Colors.greenAccent,
        cursorColor: Colors.black,
      ),
      home: Dashboard(),
      routes: {
        '/greeter': (_) => GreeterPage(),
      },
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open Greeter'),
          onPressed: () {
            Navigator.of(context).pushNamed('/greeter');
          },
        ),
      ),
    );
  }
}

class GreeterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameEditingController = TextEditingController();
    return BaseView<GreeterViewModel>(
      builder: (context, _viewModel, _) => Scaffold(
        appBar: AppBar(
          title: Text('Greeter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: nameEditingController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Enter your name',
                ),
              ),
              RaisedButton(
                child: Text('Greet'),
                onPressed: () {
                  _viewModel.getGreeting(nameEditingController.text);
                },
              ),
              Expanded(
                  child: Center(
                      child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StreamBuilder<String>(
                      stream: _viewModel.greetingMessageController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data == 'showProgress') {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasData &&
                            snapshot.data.isNotEmpty) {
                          return Column(
                            children: <Widget>[
                              Text(
                                snapshot.data ?? 'No data yet',
                                style: Theme.of(context).textTheme.display1,
                              ),
                              IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  nameEditingController.clear();
                                  _viewModel.clear();
                                },
                              )
                            ],
                          );
                        }
                        return Text('Nothing here yet');
                      }),
                ],
              ))),
            ],
          ),
        ),
      ),
    );
  }
}
