// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      books: json['books'] as int? ?? 0,
      image: json['image'] as String,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'books': instance.books,
      'image': instance.image,
      'active': instance.active,
    };
