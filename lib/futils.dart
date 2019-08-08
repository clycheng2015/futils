import 'dart:async';

import 'package:flutter/services.dart';

class Futils {
  static const MethodChannel _channel =
      const MethodChannel('com.toutie.flutter.utils');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get deviceUID async {
    final String version = await _channel.invokeMethod('getDeviceUID');
    return version;
  }

}
