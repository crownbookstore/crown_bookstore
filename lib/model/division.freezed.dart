// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'division.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Division _$DivisionFromJson(Map<String, dynamic> json) {
  return _Division.fromJson(json);
}

/// @nodoc
mixin _$Division {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Township> get townships => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DivisionCopyWith<Division> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DivisionCopyWith<$Res> {
  factory $DivisionCopyWith(Division value, $Res Function(Division) then) =
      _$DivisionCopyWithImpl<$Res, Division>;
  @useResult
  $Res call(
      {String id, String name, List<Township> townships, DateTime dateTime});
}

/// @nodoc
class _$DivisionCopyWithImpl<$Res, $Val extends Division>
    implements $DivisionCopyWith<$Res> {
  _$DivisionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? townships = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      townships: null == townships
          ? _value.townships
          : townships // ignore: cast_nullable_to_non_nullable
              as List<Township>,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DivisionCopyWith<$Res> implements $DivisionCopyWith<$Res> {
  factory _$$_DivisionCopyWith(
          _$_Division value, $Res Function(_$_Division) then) =
      __$$_DivisionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, List<Township> townships, DateTime dateTime});
}

/// @nodoc
class __$$_DivisionCopyWithImpl<$Res>
    extends _$DivisionCopyWithImpl<$Res, _$_Division>
    implements _$$_DivisionCopyWith<$Res> {
  __$$_DivisionCopyWithImpl(
      _$_Division _value, $Res Function(_$_Division) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? townships = null,
    Object? dateTime = null,
  }) {
    return _then(_$_Division(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      townships: null == townships
          ? _value._townships
          : townships // ignore: cast_nullable_to_non_nullable
              as List<Township>,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Division implements _Division {
  _$_Division(
      {required this.id,
      required this.name,
      required final List<Township> townships,
      required this.dateTime})
      : _townships = townships;

  factory _$_Division.fromJson(Map<String, dynamic> json) =>
      _$$_DivisionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<Township> _townships;
  @override
  List<Township> get townships {
    if (_townships is EqualUnmodifiableListView) return _townships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_townships);
  }

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'Division(id: $id, name: $name, townships: $townships, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Division &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._townships, _townships) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_townships), dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DivisionCopyWith<_$_Division> get copyWith =>
      __$$_DivisionCopyWithImpl<_$_Division>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DivisionToJson(
      this,
    );
  }
}

abstract class _Division implements Division {
  factory _Division(
      {required final String id,
      required final String name,
      required final List<Township> townships,
      required final DateTime dateTime}) = _$_Division;

  factory _Division.fromJson(Map<String, dynamic> json) = _$_Division.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Township> get townships;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_DivisionCopyWith<_$_Division> get copyWith =>
      throw _privateConstructorUsedError;
}
