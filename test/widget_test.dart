import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:greeter/main.dart';
import 'package:greeter/models/greetee.dart';
import 'package:greeter/models/greeting.dart';
import 'package:greeter/services/greeter_service.dart';
import 'package:greeter/utils/id_generator.dart';
import 'package:greeter/utils/time_utils.dart';
import 'package:mockito/mockito.dart';

//void main() {
//  testWidgets('GreeterApp', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(GreeterApp());
//
//    // Verify 'Nothing here yet...' text
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
//  });
//}

class MockIdGenerator extends Mock implements IdGenerator {}

void main() {
  test('GreeterService.greet', () async {
    final greeterService = GreeterService(IdGenerator());
    final greeting = await greeterService.greet('Deva');
    await expectLater(greeting, 'Hello, Deva!');
  });
}
