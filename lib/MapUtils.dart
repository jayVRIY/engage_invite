import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtil {

  /// 高德地图
  static Future<bool> gotoAMap(longitude, latitude) async {
    var url = '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2';

    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      print("未检测到高德地图~");
      return false;
    }

    await launch(url);

    return true;
  }
}