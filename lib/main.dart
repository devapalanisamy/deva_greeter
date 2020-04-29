import 'package:flutter/material.dart';
import 'package:greeter/core/result.dart';
import 'package:greeter/models/greeting.dart';
import 'package:greeter/services/greeter_service.dart';
import 'package:greeter/utils/id_generator.dart';
import 'package:greeter/view_models/greeter_view_model.dart';

void main() {
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

class GreeterPage extends StatefulWidget {
  @override
  _GreeterPageState createState() => _GreeterPageState();
}

class _GreeterPageState extends State<GreeterPage> {
  GreeterViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final idGenerator = IdGenerator();
    final greeterService = GreeterService(idGenerator);
    _viewModel = GreeterViewModel(greeterService)..init();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: _viewModel.name.add,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your name',
              ),
            ),
            RaisedButton(
              child: Text('Greet'),
              onPressed: () {
                _viewModel.greetEvent.add(true);
              },
            ),
            Expanded(
              child: Center(
                child: StreamBuilder<Result<Greeting>>(
                  initialData: _viewModel.greeting.value,
                  stream: _viewModel.greeting,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final result = snapshot.data;
                      if (result.isAwaiting) {
                        return CircularProgressIndicator();
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              result.value.value,
                              style: Theme.of(context).textTheme.display1,
                            ),
                            IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _viewModel.greetEvent.add(false);
                              },
                            )
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('Nothing here yet...');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
