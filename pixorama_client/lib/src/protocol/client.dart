/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'protocol.dart' as _i3;

/// {@category Endpoint}
class EndpointPixorama extends _i1.EndpointRef {
  EndpointPixorama(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pixorama';

  /// Sets a single pixel and notifies all connected clients about the change.
  _i2.Future<void> setPixel({
    required int colorIndex,
    required int pixelIndex,
  }) =>
      caller.callServerEndpoint<void>(
        'pixorama',
        'setPixel',
        {
          'colorIndex': colorIndex,
          'pixelIndex': pixelIndex,
        },
      );

  /// Returns a stream of image updates. The first message will always be a
  /// `ImageData` object, which contains the full image. Sequential updates
  /// will be `ImageUpdate` objects, which contains a single updated pixel.
  _i2.Stream<dynamic> imageUpdates() =>
      caller.callStreamingServerEndpoint<_i2.Stream<dynamic>, dynamic>(
        'pixorama',
        'imageUpdates',
        {},
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i3.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    pixorama = EndpointPixorama(this);
  }

  late final EndpointPixorama pixorama;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'pixorama': pixorama};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
