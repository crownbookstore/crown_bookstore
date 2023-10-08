// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Division _$$_DivisionFromJson(Map<String, dynamic> json) => _$_Division(
      id: json['id'] as String,
      name: json['name'] as String,
      townships: (json['townships'] as List<dynamic>)
          .map((e) => Township.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$_DivisionToJson(_$_Division instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'townships': instance.townships.map((e) => e.toJson()).toList(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
