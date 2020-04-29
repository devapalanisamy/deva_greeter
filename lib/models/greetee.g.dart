// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greetee.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Greetee> _$greeteeSerializer = new _$GreeteeSerializer();

class _$GreeteeSerializer implements StructuredSerializer<Greetee> {
  @override
  final Iterable<Type> types = const [Greetee, _$Greetee];
  @override
  final String wireName = 'Greetee';

  @override
  Iterable<Object> serialize(Serializers serializers, Greetee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Greetee deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GreeteeBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Greetee extends Greetee {
  @override
  final String id;
  @override
  final String name;

  factory _$Greetee([void Function(GreeteeBuilder) updates]) =>
      (new GreeteeBuilder()..update(updates)).build();

  _$Greetee._({this.id, this.name}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Greetee', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Greetee', 'name');
    }
  }

  @override
  Greetee rebuild(void Function(GreeteeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GreeteeBuilder toBuilder() => new GreeteeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Greetee && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Greetee')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GreeteeBuilder implements Builder<Greetee, GreeteeBuilder> {
  _$Greetee _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GreeteeBuilder();

  GreeteeBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Greetee other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Greetee;
  }

  @override
  void update(void Function(GreeteeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Greetee build() {
    final _$result = _$v ?? new _$Greetee._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
