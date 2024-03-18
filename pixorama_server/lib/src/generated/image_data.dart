/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'dart:typed_data' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class ImageData extends _i1.TableRow {
  ImageData._({
    int? id,
    required this.pixels,
    required this.width,
    required this.height,
  }) : super(id);

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

  static final t = ImageDataTable();

  static const db = ImageDataRepository._();

  _i2.ByteData pixels;

  int width;

  int height;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
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
      if (id != null) 'id': id,
      'pixels': pixels.toJson(),
      'width': width,
      'height': height,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
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

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<ImageData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
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

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<ImageData?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
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

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ImageData?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ImageData>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ImageDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ImageData>(
      where: where(ImageData.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
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

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
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

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
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

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
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

  static ImageDataInclude include() {
    return ImageDataInclude._();
  }

  static ImageDataIncludeList includeList({
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ImageDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImageDataTable>? orderByList,
    ImageDataInclude? include,
  }) {
    return ImageDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ImageData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ImageData.t),
      include: include,
    );
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

class ImageDataTable extends _i1.Table {
  ImageDataTable({super.tableRelation}) : super(tableName: 'image_data') {
    pixels = _i1.ColumnByteData(
      'pixels',
      this,
    );
    width = _i1.ColumnInt(
      'width',
      this,
    );
    height = _i1.ColumnInt(
      'height',
      this,
    );
  }

  late final _i1.ColumnByteData pixels;

  late final _i1.ColumnInt width;

  late final _i1.ColumnInt height;

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

class ImageDataInclude extends _i1.IncludeObject {
  ImageDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ImageData.t;
}

class ImageDataIncludeList extends _i1.IncludeList {
  ImageDataIncludeList._({
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ImageData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ImageData.t;
}

class ImageDataRepository {
  const ImageDataRepository._();

  Future<List<ImageData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ImageDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImageDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<ImageData>(
      where: where?.call(ImageData.t),
      orderBy: orderBy?.call(ImageData.t),
      orderByList: orderByList?.call(ImageData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ImageData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<ImageDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ImageDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ImageData>(
      where: where?.call(ImageData.t),
      orderBy: orderBy?.call(ImageData.t),
      orderByList: orderByList?.call(ImageData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ImageData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ImageData>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ImageData>> insert(
    _i1.Session session,
    List<ImageData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ImageData>(
      rows,
      transaction: transaction,
    );
  }

  Future<ImageData> insertRow(
    _i1.Session session,
    ImageData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ImageData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ImageData>> update(
    _i1.Session session,
    List<ImageData> rows, {
    _i1.ColumnSelections<ImageDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ImageData>(
      rows,
      columns: columns?.call(ImageData.t),
      transaction: transaction,
    );
  }

  Future<ImageData> updateRow(
    _i1.Session session,
    ImageData row, {
    _i1.ColumnSelections<ImageDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ImageData>(
      row,
      columns: columns?.call(ImageData.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ImageData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ImageData>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ImageData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ImageData>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ImageDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ImageData>(
      where: where(ImageData.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ImageDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ImageData>(
      where: where?.call(ImageData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
