import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:launch_review/launch_review.dart';

class UpdateWidget extends StatefulWidget {
  const UpdateWidget({
    Key? key,
    required this.transparentBackground,
    required this.backgroundColor,
    required this.logo,
    required this.message,
    required this.textColor,
    required this.updateButton,
    required this.isPriorityHigh,
    required this.skipButton,
  }) : super(key: key);

  final bool transparentBackground;
  final Color backgroundColor;
  final Widget logo;
  final String message;
  final Color textColor;
  final Widget updateButton;
  final bool isPriorityHigh;
  final Widget skipButton;

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  bool _shouldShow = true;

  @override
  Widget build(BuildContext context) {
    return _shouldShow
        ? Material(
            color: widget.transparentBackground
                ? widget.backgroundColor.withOpacity(0.8)
                : widget.backgroundColor,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 140, child: widget.logo),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            widget.message,
                            style: TextStyle(
                                color: widget.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 14),
                        InkWell(
                          onTap: () async {
                            PackageInfo packageInfo =
                                await PackageInfo.fromPlatform();
                            String packageName = packageInfo.packageName;
                            // final Uri _uri = Uri.parse(
                            //     "https://play.google.com/store/apps/details?id=$packageName");
                            // if (!await launchUrl(_uri)) {
                            //   print("Could not launch url");
                            // }

                            LaunchReview.launch(
                                androidAppId: "$packageName",
                                iOSAppId: "tech.nagorik.mymatch");
                          },
                          child: widget.updateButton,
                        ),
                        const SizedBox(height: 14),
                        !widget.isPriorityHigh
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    _shouldShow = false;
                                  });
                                },
                                child: widget.skipButton,
                              )
                            : Container(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
