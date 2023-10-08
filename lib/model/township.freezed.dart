// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'township.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Township _$TownshipFromJson(Map<String, dynamic> json) {
  return _Township.fromJson(json);
}

/// @nodoc
mixin _$Township {
  int get fee => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TownshipCopyWith<Township> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TownshipCopyWith<$Res> {
  factory $TownshipCopyWith(Township value, $Res Function(Township) then) =
      _$TownshipCopyWithImpl<$Res, Township>;
  @useResult
  $Res call({int fee, String name});
}

/// @nodoc
class _$TownshipCopyWithImpl<$Res, $Val extends Township>
    implements $TownshipCopyWith<$Res> {
  _$TownshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TownshipCopyWith<$Res> implements $TownshipCopyWith<$Res> {
  factory _$$_TownshipCopyWith(
          _$_Township value, $Res Function(_$_Township) then) =
      __$$_TownshipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int fee, String name});
}

/// @nodoc
class __$$_TownshipCopyWithImpl<$Res>
    extends _$TownshipCopyWithImpl<$Res, _$_Township>
    implements _$$_TownshipCopyWith<$Res> {
  __$$_TownshipCopyWithImpl(
      _$_Township _value, $Res Function(_$_Township) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = null,
    Object? name = null,
  }) {
    return _then(_$_Township(
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Township implements _Township {
  _$_Township({required this.fee, required this.name});

  factory _$_Township.fromJson(Map<String, dynamic> json) =>
      _$$_TownshipFromJson(json);

  @override
  final int fee;
  @override
  final String name;

  @override
  String toString() {
    return 'Township(fee: $fee, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Township &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fee, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TownshipCopyWith<_$_Township> get copyWith =>
      __$$_TownshipCopyWithImpl<_$_Township>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TownshipToJson(
      this,
    );
  }
}

abstract class _Township implements Township {
  factory _Township({required final int fee, required final String name}) =
      _$_Township;

  factory _Township.fromJson(Map<String, dynamic> json) = _$_Township.fromJson;

  @override
  int get fee;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TownshipCopyWith<_$_Township> get copyWith =>
      throw _privateConstructorUsedError;
}
