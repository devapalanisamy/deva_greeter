// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greeting.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Greeting> _$greetingSerializer = new _$GreetingSerializer();

class _$GreetingSerializer implements StructuredSerializer<Greeting> {
  @override
  final Iterable<Type> types = const [Greeting, _$Greeting];
  @override
  final String wireName = 'Greeting';

  @override
  Iterable<Object> serialize(Serializers serializers, Greeting object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Greeting deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreetingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Greeting extends Greeting {
  @override
  final String id;
  @override
  final String value;
  @override
  final DateTime timestamp;

  factory _$Greeting([void Function(GreetingBuilder) updates]) =>
      (new GreetingBuilder()..update(updates)).build();

  _$Greeting._({this.id, this.value, this.timestamp}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Greeting', 'id');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('Greeting', 'value');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Greeting', 'timestamp');
    }
  }

  @override
  Greeting rebuild(void Function(GreetingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreetingBuilder toBuilder() => new GreetingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Greeting &&
        id == other.id &&
        value == other.value &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), value.hashCode), timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Greeting')
          ..add('id', id)
          ..add('value', value)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class GreetingBuilder implements Builder<Greeting, GreetingBuilder> {
  _$Greeting _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  GreetingBuilder();

  GreetingBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _value = _$v.value;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Greeting other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Greeting;
  }

  @override
  void update(void Function(GreetingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Greeting build() {
    final _$result =
        _$v ?? new _$Greeting._(id: id, value: value, timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
