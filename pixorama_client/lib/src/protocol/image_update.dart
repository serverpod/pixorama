/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class ImageUpdate extends _i1.SerializableEntity {
  ImageUpdate({
    required this.pixelIndex,
    required this.colorIndex,
  });

  factory ImageUpdate.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ImageUpdate(
      pixelIndex: serializationManager
          .deserialize<int>(jsonSerialization['pixelIndex']),
      colorIndex: serializationManager
          .deserialize<int>(jsonSerialization['colorIndex']),
    );
  }

  int pixelIndex;

  int colorIndex;

  @override
  Map<String, dynamic> toJson() {
    return {
      'pixelIndex': pixelIndex,
      'colorIndex': colorIndex,
    };
  }
}
