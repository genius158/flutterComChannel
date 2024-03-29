import 'dart:async';

import 'package:flutter/services.dart';

class FlutterCommtool {
  static const MethodChannel _channel = const MethodChannel('flutter_commtool');

  static Future<String> getString(String name) async {
    return await _channel.invokeMethod('getString', name);
  }

  static Future<Map<String, String>> getStrings(List<String> names) async {
    final data = await _channel.invokeMethod('getStrings', names);
    return Map<String, String>.from(data);
  }

  static Future<dynamic> execute(name) async {
    return await _channel.invokeMethod('execute', name);
  }

  static Future<String> goWeb(String tag) async {
    return await _channel.invokeMethod('goWeb', tag);
  }

  static Future<String> goPage(String page) async {
    return await _channel.invokeMethod('goPage', page);
  }

  static Future<String> get(String tag, String url,
      {Map<String, String> map}) async {
    Map<String, String> finalMal = Map();
    finalMal["TAG"] = tag;
    finalMal["url"] = url;

    if (map != null) {
      finalMal.addAll(map);
    }
    return await _channel.invokeMethod('get', finalMal);
  }

  static Future<String> post(String tag, String url,
      {Map<String, String> map}) async {
    Map<String, String> finalMal = Map();
    finalMal["TAG"] = tag;
    finalMal["url"] = url;

    if (map != null) {
      finalMal.addAll(map);
    }
    return await _channel.invokeMethod('post', finalMal);
  }

  static Future<dynamic> cancel(String tag) async {
    return await _channel.invokeMethod('cancel', tag);
  }
}
