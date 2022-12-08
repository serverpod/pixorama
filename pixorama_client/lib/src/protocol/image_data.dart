/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:typed_data' as _i2;

class ImageData extends _i1.SerializableEntity {
  ImageData({
    this.id,
    required this.pixels,
    required this.width,
    required this.height,
  });

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

  int? id;

  _i2.ByteData pixels;

  int width;

  int height;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pixels': pixels,
      'width': width,
      'height': height,
    };
  }
}
