// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      discountPrice: json['discountPrice'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      authorId: json['authorId'] as String?,
      categoryId: json['categoryId'] as String?,
      authorName: json['authorName'] as String?,
      authorImage: json['authorImage'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryImage: json['categoryImage'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'score': instance.score,
      'authorId': instance.authorId,
      'categoryId': instance.categoryId,
      'authorName': instance.authorName,
      'authorImage': instance.authorImage,
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
      'count': instance.count,
    };
