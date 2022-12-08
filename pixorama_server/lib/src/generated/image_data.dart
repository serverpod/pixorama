/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'dart:typed_data' as _i2;

class ImageData extends _i1.TableRow {
  ImageData({
    int? id,
    required this.pixels,
    required this.width,
    required this.height,
  }) : super(id);

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

  static final t = ImageDataTable();

  _i2.ByteData pixels;

  int width;

  int height;

  @override
  String get tableName => 'image_data';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pixels': pixels,
      'width': width,
      'height': height,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'pixels': pixels,
      'width': width,
      'height': height,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'pixels': pixels,
      'width': width,
      'height': height,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
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
    _i1.Session session, {
    ImageDataExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
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
    _i1.Session session, {
    ImageDataExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
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

  static Future<ImageData?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ImageData>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ImageDataExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ImageData>(
      where: where(ImageData.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ImageData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ImageData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ImageData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ImageDataExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ImageData>(
      where: where != null ? where(ImageData.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ImageDataExpressionBuilder = _i1.Expression Function(ImageDataTable);

class ImageDataTable extends _i1.Table {
  ImageDataTable() : super(tableName: 'image_data');

  final id = _i1.ColumnInt('id');

  final pixels = _i1.ColumnByteData('pixels');

  final width = _i1.ColumnInt('width');

  final height = _i1.ColumnInt('height');

  @override
  List<_i1.Column> get columns => [
        id,
        pixels,
        width,
        height,
      ];
}

@Deprecated('Use ImageDataTable.t instead.')
ImageDataTable tImageData = ImageDataTable();
