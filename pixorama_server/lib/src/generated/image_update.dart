/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ImageUpdate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ImageUpdate._({
    required this.pixelIndex,
    required this.colorIndex,
  });

  factory ImageUpdate({
    required int pixelIndex,
    required int colorIndex,
  }) = _ImageUpdateImpl;

  factory ImageUpdate.fromJson(Map<String, dynamic> jsonSerialization) {
    return ImageUpdate(
      pixelIndex: jsonSerialization['pixelIndex'] as int,
      colorIndex: jsonSerialization['colorIndex'] as int,
    );
  }

  int pixelIndex;

  int colorIndex;

  ImageUpdate copyWith({
    int? pixelIndex,
    int? colorIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'pixelIndex': pixelIndex,
      'colorIndex': colorIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'pixelIndex': pixelIndex,
      'colorIndex': colorIndex,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ImageUpdateImpl extends ImageUpdate {
  _ImageUpdateImpl({
    required int pixelIndex,
    required int colorIndex,
  }) : super._(
          pixelIndex: pixelIndex,
          colorIndex: colorIndex,
        );

  @override
  ImageUpdate copyWith({
    int? pixelIndex,
    int? colorIndex,
  }) {
    return ImageUpdate(
      pixelIndex: pixelIndex ?? this.pixelIndex,
      colorIndex: colorIndex ?? this.colorIndex,
    );
  }
}
