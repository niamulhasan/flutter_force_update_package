part of flutter_force_update;

class ForceUpdatePrompt extends StatelessWidget {
  final String? androidVersionName;
  final String? androidVersionCode;
  final String? iosVersionName;
  final String? iosVersionCode;
  final bool? androidPriorityIsHigh;
  final bool? iosPriorityIsHigh;
  final bool ignore;
  final Color backgroundColor;
  final Color textColor;
  final Widget logo;
  final bool transparentBackground;
  final String message;
  final Widget updateButton;
  final Widget skipButton;

  const ForceUpdatePrompt({
    Key? key,
    required this.androidVersionName,
    required this.androidVersionCode,
    required this.iosVersionName,
    required this.iosVersionCode,
    required this.androidPriorityIsHigh,
    required this.iosPriorityIsHigh,
    this.ignore = false,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.logo,
    this.transparentBackground = false,
    required this.message,
    required this.updateButton,
    required this.skipButton,
  }) : super(key: key);

  bool get isPriorityHigh {
    if (Platform.isAndroid) {
      return androidPriorityIsHigh ?? false;
    } else {
      return iosPriorityIsHigh ?? false;
    }
  }

  Future<bool> _isUpdateAvailable() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    int localVersion = int.parse(packageInfo.version.replaceAll(".", ""));
    int localBuildNumber = int.parse(packageInfo.buildNumber);

    // LOGGING START
    if (false) {
      print(
          "Version Name Android: Local:Remote : $localVersion : $androidVersionName");
      print("Version Name iOS: Local:Remote : $localVersion : $iosVersionName");
      print(
          "Version Code Android: Local:Remote : $localBuildNumber : $androidVersionCode");
      print(
          "Version Code iOS: Local:Remote : $localBuildNumber : $iosVersionName");
    }
    //LOGGING END

    if (Platform.isAndroid) {
      if (androidVersionName == null || androidVersionCode == null) {
        return false;
      }
      if (localVersion < int.parse(androidVersionName!.replaceAll(".", "")) ||
          localBuildNumber < int.parse(androidVersionCode!)) {
        return true;
      }
    }

    if (Platform.isIOS) {
      if (iosVersionName == null || iosVersionCode == null) {
        return false;
      }
      if (localVersion < int.parse(iosVersionName!.replaceAll(".", "")) ||
          localBuildNumber < int.parse(iosVersionCode!)) {
        return true;
      }
    }
    return false;
  }

  void printIsUpdateAvailable() async {
    print("Update decision: " + (await _isUpdateAvailable()).toString());
  }

  @override
  Widget build(BuildContext context) {
    printIsUpdateAvailable();
    return !ignore
        ? FutureBuilder(
            future: _isUpdateAvailable(),
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && (snapshot.data ?? false)) {
                return UpdateWidget(
                  transparentBackground: transparentBackground,
                  backgroundColor: backgroundColor,
                  logo: logo,
                  message: message,
                  textColor: textColor,
                  updateButton: updateButton,
                  isPriorityHigh: isPriorityHigh,
                  skipButton: skipButton,
                );
              } else {
                return Container();
              }
              return const Center(
                  child: CircularProgressIndicator(color: Colors.red));
            },
          )
        : Container();
  }
}
