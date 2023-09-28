// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  List<Book> get items => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<dynamic> get deliveryTownshipInfo => throw _privateConstructorUsedError;
  @JsonKey(nullable: true)
  String? get bankSlipImage => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res, PurchaseModel>;
  @useResult
  $Res call(
      {String id,
      List<Book> items,
      String name,
      String email,
      String phone,
      String address,
      int total,
      List<dynamic> deliveryTownshipInfo,
      @JsonKey(nullable: true) String? bankSlipImage,
      String? paymentMethod,
      String dateTime});
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res, $Val extends PurchaseModel>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? total = null,
    Object? deliveryTownshipInfo = null,
    Object? bankSlipImage = freezed,
    Object? paymentMethod = freezed,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTownshipInfo: null == deliveryTownshipInfo
          ? _value.deliveryTownshipInfo
          : deliveryTownshipInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      bankSlipImage: freezed == bankSlipImage
          ? _value.bankSlipImage
          : bankSlipImage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseModelCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$$_PurchaseModelCopyWith(
          _$_PurchaseModel value, $Res Function(_$_PurchaseModel) then) =
      __$$_PurchaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<Book> items,
      String name,
      String email,
      String phone,
      String address,
      int total,
      List<dynamic> deliveryTownshipInfo,
      @JsonKey(nullable: true) String? bankSlipImage,
      String? paymentMethod,
      String dateTime});
}

/// @nodoc
class __$$_PurchaseModelCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res, _$_PurchaseModel>
    implements _$$_PurchaseModelCopyWith<$Res> {
  __$$_PurchaseModelCopyWithImpl(
      _$_PurchaseModel _value, $Res Function(_$_PurchaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? total = null,
    Object? deliveryTownshipInfo = null,
    Object? bankSlipImage = freezed,
    Object? paymentMethod = freezed,
    Object? dateTime = null,
  }) {
    return _then(_$_PurchaseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTownshipInfo: null == deliveryTownshipInfo
          ? _value._deliveryTownshipInfo
          : deliveryTownshipInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      bankSlipImage: freezed == bankSlipImage
          ? _value.bankSlipImage
          : bankSlipImage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PurchaseModel implements _PurchaseModel {
  _$_PurchaseModel(
      {required this.id,
      required final List<Book> items,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.total,
      required final List<dynamic> deliveryTownshipInfo,
      @JsonKey(nullable: true) this.bankSlipImage,
      this.paymentMethod,
      required this.dateTime})
      : _items = items,
        _deliveryTownshipInfo = deliveryTownshipInfo;

  factory _$_PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseModelFromJson(json);

  @override
  final String id;
  final List<Book> _items;
  @override
  List<Book> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String address;
  @override
  final int total;
  final List<dynamic> _deliveryTownshipInfo;
  @override
  List<dynamic> get deliveryTownshipInfo {
    if (_deliveryTownshipInfo is EqualUnmodifiableListView)
      return _deliveryTownshipInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryTownshipInfo);
  }

  @override
  @JsonKey(nullable: true)
  final String? bankSlipImage;
  @override
  final String? paymentMethod;
  @override
  final String dateTime;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, items: $items, name: $name, email: $email, phone: $phone, address: $address, total: $total, deliveryTownshipInfo: $deliveryTownshipInfo, bankSlipImage: $bankSlipImage, paymentMethod: $paymentMethod, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._deliveryTownshipInfo, _deliveryTownshipInfo) &&
            (identical(other.bankSlipImage, bankSlipImage) ||
                other.bankSlipImage == bankSlipImage) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      name,
      email,
      phone,
      address,
      total,
      const DeepCollectionEquality().hash(_deliveryTownshipInfo),
      bankSlipImage,
      paymentMethod,
      dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseModelCopyWith<_$_PurchaseModel> get copyWith =>
      __$$_PurchaseModelCopyWithImpl<_$_PurchaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseModelToJson(
      this,
    );
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  factory _PurchaseModel(
      {required final String id,
      required final List<Book> items,
      required final String name,
      required final String email,
      required final String phone,
      required final String address,
      required final int total,
      required final List<dynamic> deliveryTownshipInfo,
      @JsonKey(nullable: true) final String? bankSlipImage,
      final String? paymentMethod,
      required final String dateTime}) = _$_PurchaseModel;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseModel.fromJson;

  @override
  String get id;
  @override
  List<Book> get items;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get address;
  @override
  int get total;
  @override
  List<dynamic> get deliveryTownshipInfo;
  @override
  @JsonKey(nullable: true)
  String? get bankSlipImage;
  @override
  String? get paymentMethod;
  @override
  String get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseModelCopyWith<_$_PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
