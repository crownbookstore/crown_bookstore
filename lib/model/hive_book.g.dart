// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBookAdapter extends TypeAdapter<HiveBook> {
  @override
  final int typeId = 1;

  @override
  HiveBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBook(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as String,
      price: fields[4] as int,
      count: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBook obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
