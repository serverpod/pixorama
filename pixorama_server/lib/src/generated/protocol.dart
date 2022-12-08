/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'image_data.dart' as _i2;
import 'image_update.dart' as _i3;
import 'package:serverpod/protocol.dart' as _i4;
export 'image_data.dart';
export 'image_update.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.ImageData) {
      return _i2.ImageData.fromJson(data, this) as T;
    }
    if (t == _i3.ImageUpdate) {
      return _i3.ImageUpdate.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ImageData?>()) {
      return (data != null ? _i2.ImageData.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.ImageUpdate?>()) {
      return (data != null ? _i3.ImageUpdate.fromJson(data, this) : null) as T;
    }
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ImageData) {
      return 'ImageData';
    }
    if (data is _i3.ImageUpdate) {
      return 'ImageUpdate';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ImageData') {
      return deserialize<_i2.ImageData>(data['data']);
    }
    if (data['className'] == 'ImageUpdate') {
      return deserialize<_i3.ImageUpdate>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i2.ImageData:
        return _i2.ImageData.t;
    }
    return null;
  }
}
