/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'dart:typed_data';
import 'protocol.dart';

class ImageData extends TableRow {
  @override
  String get className => 'ImageData';
  @override
  String get tableName => 'image_data';

  static final t = ImageDataTable();

  @override
  int? id;
  late ByteData pixels;
  late int width;
  late int height;

  ImageData({
    this.id,
    required this.pixels,
    required this.width,
    required this.height,
  });

  ImageData.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    pixels = _data['pixels'] is String
        ? (_data['pixels'] as String).base64DecodedByteData()!
        : ByteData.view((_data['pixels'] as Uint8List).buffer);
    width = _data['width']!;
    height = _data['height']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'pixels': pixels.base64encodedString(),
      'width': width,
      'height': height,
    });
  }

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'pixels': pixels.base64encodedString(),
      'width': width,
      'height': height,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'pixels': pixels.base64encodedString(),
      'width': width,
      'height': height,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'pixels':
        pixels = value;
        return;
      case 'width':
        width = value;
        return;
      case 'height':
        height = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ImageData>> find(
    Session session, {
    ImageDataExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<ImageData>(
      where: where != null ? where(ImageData.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImageData?> findSingleRow(
    Session session, {
    ImageDataExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ImageData>(
      where: where != null ? where(ImageData.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImageData?> findById(Session session, int id) async {
    return session.db.findById<ImageData>(id);
  }

  static Future<int> delete(
    Session session, {
    required ImageDataExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<ImageData>(
      where: where(ImageData.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    ImageData row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    ImageData row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    ImageData row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    ImageDataExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<ImageData>(
      where: where != null ? where(ImageData.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ImageDataExpressionBuilder = Expression Function(ImageDataTable t);

class ImageDataTable extends Table {
  ImageDataTable() : super(tableName: 'image_data');

  @override
  String tableName = 'image_data';
  final id = ColumnInt('id');
  final pixels = ColumnByteData('pixels');
  final width = ColumnInt('width');
  final height = ColumnInt('height');

  @override
  List<Column> get columns => [
        id,
        pixels,
        width,
        height,
      ];
}

@Deprecated('Use ImageDataTable.t instead.')
ImageDataTable tImageData = ImageDataTable();
