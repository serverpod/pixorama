/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:typed_data' as _i2;

abstract class ImageData implements _i1.SerializableModel {
  ImageData._({
    required this.pixels,
    required this.width,
    required this.height,
  });

  factory ImageData({
    required _i2.ByteData pixels,
    required int width,
    required int height,
  }) = _ImageDataImpl;

  factory ImageData.fromJson(Map<String, dynamic> jsonSerialization) {
    return ImageData(
      pixels: _i1.ByteDataJsonExtension.fromJson(jsonSerialization['pixels']),
      width: jsonSerialization['width'] as int,
      height: jsonSerialization['height'] as int,
    );
  }

  _i2.ByteData pixels;

  int width;

  int height;

  ImageData copyWith({
    _i2.ByteData? pixels,
    int? width,
    int? height,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'pixels': pixels.toJson(),
      'width': width,
      'height': height,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ImageDataImpl extends ImageData {
  _ImageDataImpl({
    required _i2.ByteData pixels,
    required int width,
    required int height,
  }) : super._(
          pixels: pixels,
          width: width,
          height: height,
        );

  @override
  ImageData copyWith({
    _i2.ByteData? pixels,
    int? width,
    int? height,
  }) {
    return ImageData(
      pixels: pixels ?? this.pixels.clone(),
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
