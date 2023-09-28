import 'dart:core';

import 'package:hive/hive.dart';

part 'hive_book.g.dart';

@HiveType(typeId: 1)
class HiveBook {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  @HiveField(3)
  int count;
  @HiveField(4)
  int price;
  HiveBook({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.count,
  });
}
