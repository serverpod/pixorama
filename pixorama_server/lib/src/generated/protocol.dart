/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

library protocol;

// ignore: unused_import
import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';

import 'image_data.dart';
import 'image_update.dart';

export 'image_data.dart';
export 'image_update.dart';

class Protocol extends SerializationManagerServer {
  static final Protocol instance = Protocol();

  final Map<String, constructor> _constructors = {};
  @override
  Map<String, constructor> get constructors => _constructors;

  final Map<String, String> _tableClassMapping = {};
  @override
  Map<String, String> get tableClassMapping => _tableClassMapping;

  final Map<Type, Table> _typeTableMapping = {};
  @override
  Map<Type, Table> get typeTableMapping => _typeTableMapping;

  Protocol() {
    constructors['ImageData'] = (Map<String, dynamic> serialization) =>
        ImageData.fromSerialization(serialization);
    constructors['ImageUpdate'] = (Map<String, dynamic> serialization) =>
        ImageUpdate.fromSerialization(serialization);

    tableClassMapping['image_data'] = 'ImageData';
    typeTableMapping[ImageData] = ImageData.t;
  }
}
