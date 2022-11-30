import 'dart:convert';
import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

import '../models/force_update_local_data.dart';
import '../models/force_update_remote_data.dart';
import 'package:http/http.dart' as http;

import '../models/force_update_remote_decision.dart';

class ForceUpdateUtils {
  static Future<ForceUpdateRemoteData?> getRemoteUpdateStatus(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ForceUpdateRemoteData.fromJson(jsonDecode(response.body)[0]);
    }
    return null;
  }

  static Future<ForceUpdateRemoteDecision> postLocalInfoForRemoteDecision(
      String url) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    ForceUpdateLocalData localData = ForceUpdateLocalData(
        platform: Platform.isAndroid ? "android" : "ios",
        appName: "romoni-user",
        versionCode: packageInfo.buildNumber,
    );
    http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(localData.toJson()));
    if (response.statusCode == 200) {
      return ForceUpdateRemoteDecision.fromJson(jsonDecode(response.body));
    }
    return ForceUpdateRemoteDecision();
  }
}