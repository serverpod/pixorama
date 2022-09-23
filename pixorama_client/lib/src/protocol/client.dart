/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointPixorama extends EndpointRef {
  @override
  String get name => 'pixorama';

  _EndpointPixorama(EndpointCaller caller) : super(caller);
}

class Client extends ServerpodClient {
  late final _EndpointPixorama pixorama;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    pixorama = _EndpointPixorama(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'pixorama': pixorama,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
