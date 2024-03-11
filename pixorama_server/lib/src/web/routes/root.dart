import 'dart:io';

import 'package:pixorama_server/src/web/widgets/index_page_widget.dart';
import 'package:serverpod/serverpod.dart';

class RouteRoot extends WidgetRoute {
  @override
  Future<Widget> build(Session session, HttpRequest request) async {
    return IndexPageWidget();
  }
}
