import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'greeting.g.dart';

abstract class Greeting implements Built<Greeting, GreetingBuilder> {
  String get id;

  String get value;

  DateTime get timestamp;

  Greeting._();

  factory Greeting([void Function(GreetingBuilder) updates]) = _$Greeting;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Greeting.serializer, this);
  }

  static Greeting fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Greeting.serializer, json);
  }

  static Serializer<Greeting> get serializer => _$greetingSerializer;
}
