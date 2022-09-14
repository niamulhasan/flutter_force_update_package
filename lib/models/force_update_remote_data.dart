class ForceUpdateRemoteData {
  String? androidVersionName;
  String? androidVersionCode;
  String? iosVersionName;
  String? iosVersionCode;
  bool? androidPriorityIsHigh;
  bool? iosPriorityIsHigh;
  String? message;

  ForceUpdateRemoteData({
    this.androidVersionName,
    this.androidVersionCode,
    this.iosVersionName,
    this.iosVersionCode,
    this.androidPriorityIsHigh,
    this.iosPriorityIsHigh,
    this.message,
  });

  ForceUpdateRemoteData.fromJson(Map<String, dynamic> json) {
    androidVersionName = json['android_version_name'];
    androidVersionCode = json['android_version_code'];
    iosVersionName = json['ios_version_name'];
    iosVersionCode = json['ios_version_code'];
    androidPriorityIsHigh = json['android_priority_is_high'];
    iosPriorityIsHigh = json['ios_priority_is_high'];
    message = json['message'];
  }
}
