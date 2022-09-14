import 'dart:convert';

import '../models/force_update_remote_data.dart';
import 'package:http/http.dart' as http;

class ForceUpdateUtils {
  static Future<ForceUpdateRemoteData?> getRemoteUpdateStatus(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ForceUpdateRemoteData.fromJson(jsonDecode(response.body)[0]);
    }
    return null;
  }
}