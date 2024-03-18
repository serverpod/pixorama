/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

/// The Pixorama endpoint handles all communication related to keeping clients
/// up-to-date with the latest version of the pixel image. When a client first
/// connects, it is sent a full version of the image with the ImageData message.
/// Whenever a pixel is being edited by a client, we store the edit in the
/// _pixelData array and pass on the changes to all connected clients.
/// {@category Endpoint}
class EndpointPixorama extends _i1.EndpointRef {
  EndpointPixorama(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pixorama';
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i2.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    pixorama = EndpointPixorama(this);
  }

  late final EndpointPixorama pixorama;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'pixorama': pixorama};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
