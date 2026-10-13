import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// String payloads of `window.postMessage` events (JSON sent by the editor iframe).
Stream<String> get windowMessages =>
    web.EventStreamProviders.messageEvent.forTarget(web.window).where((event) => event.data.isA<JSString>()).map((event) => (event.data as JSString).toDart);

/// Posts [message] to the current window, where [windowMessages] and the editor iframe receive it.
void postWindowMessage(String message) => web.window.postMessage(message.toJS, '*'.toJS);
