// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_modelll.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NasaModelAdapter extends TypeAdapter<NasaModel> {
  @override
  final int typeId = 1;

  @override
  NasaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NasaModel(
      id: fields[0] as int?,
      camera: fields[1] as Camera?,
      imgSrc: fields[2] as String?,
      earthDate: fields[3] as String?,
      rover: fields[4] as Rover?,
    );
  }

  @override
  void write(BinaryWriter writer, NasaModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.camera)
      ..writeByte(2)
      ..write(obj.imgSrc)
      ..writeByte(3)
      ..write(obj.earthDate)
      ..writeByte(4)
      ..write(obj.rover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NasaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CameraAdapter extends TypeAdapter<Camera> {
  @override
  final int typeId = 2;

  @override
  Camera read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Camera(
      fullName: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Camera obj) {
    writer
      ..writeByte(1)
      ..writeByte(5)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CameraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoverAdapter extends TypeAdapter<Rover> {
  @override
  final int typeId = 3;

  @override
  Rover read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rover(
      name: fields[6] as String?,
      landingDate: fields[7] as String?,
      launchDate: fields[8] as String?,
      status: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Rover obj) {
    writer
      ..writeByte(4)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.landingDate)
      ..writeByte(8)
      ..write(obj.launchDate)
      ..writeByte(9)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoverAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
