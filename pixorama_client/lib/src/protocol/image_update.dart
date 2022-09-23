/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class ImageUpdate extends SerializableEntity {
  @override
  String get className => 'ImageUpdate';

  late int pixelIndex;
  late int colorIndex;

  ImageUpdate({
    required this.pixelIndex,
    required this.colorIndex,
  });

  ImageUpdate.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    pixelIndex = _data['pixelIndex']!;
    colorIndex = _data['colorIndex']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'pixelIndex': pixelIndex,
      'colorIndex': colorIndex,
    });
  }
}
