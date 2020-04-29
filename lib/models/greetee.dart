import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'greetee.g.dart';

abstract class Greetee implements Built<Greetee, GreeteeBuilder> {
  String get id;

  String get name;

  Greetee._();

  factory Greetee([void Function(GreeteeBuilder) updates]) = _$Greetee;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Greetee.serializer, this);
  }

  static Greetee fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Greetee.serializer, json);
  }

  static Serializer<Greetee> get serializer => _$greeteeSerializer;
}
