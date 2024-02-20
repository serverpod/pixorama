/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:typed_data' as _i2;

abstract class ImageData extends _i1.SerializableEntity {
  ImageData._({
    this.id,
    required this.pixels,
    required this.width,
    required this.height,
  });

  factory ImageData({
    int? id,
    required _i2.ByteData pixels,
    required int width,
    required int height,
  }) = _ImageDataImpl;

  factory ImageData.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ImageData(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      pixels: serializationManager
          .deserialize<_i2.ByteData>(jsonSerialization['pixels']),
      width: serializationManager.deserialize<int>(jsonSerialization['width']),
      height:
          serializationManager.deserialize<int>(jsonSerialization['height']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.ByteData pixels;

  int width;

  int height;

  ImageData copyWith({
    int? id,
    _i2.ByteData? pixels,
    int? width,
    int? height,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pixels': pixels.toJson(),
      'width': width,
      'height': height,
    };
  }
}

class _Undefined {}

class _ImageDataImpl extends ImageData {
  _ImageDataImpl({
    int? id,
    required _i2.ByteData pixels,
    required int width,
    required int height,
  }) : super._(
          id: id,
          pixels: pixels,
          width: width,
          height: height,
        );

  @override
  ImageData copyWith({
    Object? id = _Undefined,
    _i2.ByteData? pixels,
    int? width,
    int? height,
  }) {
    return ImageData(
      id: id is int? ? id : this.id,
      pixels: pixels ?? this.pixels.clone(),
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
