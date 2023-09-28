// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseModel _$$_PurchaseModelFromJson(Map<String, dynamic> json) =>
    _$_PurchaseModel(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      total: json['total'] as int,
      deliveryTownshipInfo: json['deliveryTownshipInfo'] as List<dynamic>,
      bankSlipImage: json['bankSlipImage'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$$_PurchaseModelToJson(_$_PurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'total': instance.total,
      'deliveryTownshipInfo': instance.deliveryTownshipInfo,
      'bankSlipImage': instance.bankSlipImage,
      'paymentMethod': instance.paymentMethod,
      'dateTime': instance.dateTime,
    };
