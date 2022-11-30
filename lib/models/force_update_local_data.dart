class ForceUpdateLocalData {

  String? platform;
  String? appName;
  String? versionCode;

  ForceUpdateLocalData({
    this.platform,
    this.appName,
    this.versionCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['platform'] = this.platform;
    data['app_name'] = this.appName;
    data['version_code'] = this.versionCode;
    return data;
  }
}