import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:greeter/models/greetee.dart';
import 'package:greeter/models/greeting.dart';

part 'serializers.g.dart';

@SerializersFor([
  Greetee,
  Greeting,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();