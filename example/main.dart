// import 'package:flutter/material.dart';
// import 'package:flutter_force_update/flutter_force_update.dart';
// import 'package:flutter_force_update/models/force_update_local_data.dart';
// import 'package:flutter_force_update/models/force_update_remote_data.dart';
// import 'package:flutter_force_update/models/force_update_remote_decision.dart';
// import 'package:flutter_force_update/utils/force_update_utils.dart';
// import 'package:flutter_force_update/widgets/update_widget.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Material App Bar'),
//         ),
//         body: HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Center(
//           child: Container(
//             child: Text("Hello"),
//           ),
//         ),
//         // FutureBuilder(
//         //   future: ForceUpdateUtils.getRemoteUpdateStatus(
//         //       "https://62b43f19530b26da4cb9fcc0.mockapi.io/check-update"),
//         //   builder: (context, AsyncSnapshot<ForceUpdateRemoteData?> snapshot) {
//         //     if (snapshot.hasData && snapshot.data != null) {
//         //       return ForceUpdatePrompt(
//         //         androidVersionName: snapshot.data!.androidVersionName,
//         //         androidVersionCode: snapshot.data!.androidVersionCode,
//         //         iosVersionName: snapshot.data!.iosVersionName,
//         //         iosVersionCode: snapshot.data!.iosVersionCode,
//         //         androidPriorityIsHigh: snapshot.data!.androidPriorityIsHigh,
//         //         iosPriorityIsHigh: snapshot.data!.iosPriorityIsHigh,
//         //         backgroundColor: Colors.purple,
//         //         logo: Icon(
//         //           Icons.handyman,
//         //           size: 140,
//         //         ),
//         //         transparentBackground: true,
//         //         message: snapshot.data!.message ?? "New version available",
//         //         updateButton: Padding(
//         //           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//         //           child: MyButton(
//         //             text: "Update Now",
//         //           ),
//         //         ),
//         //         skipButton: Padding(
//         //           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//         //           child: MyButton(
//         //             text: "Skip",
//         //           ),
//         //         ),
//         //       );
//         //     }
//         //     return const Center(child: CircularProgressIndicator());
//         //   },
//         // ),
//
//
//         //For server side decision
//
//
//         FutureBuilder(
//           future: ForceUpdateUtils.postLocalInfoForRemoteDecision(
//               "https://developers.romoni.com.bd/api/v3.0/check-version"),
//           builder: (context, sn) {
//             if (sn.hasData && sn.data != null) {
//               ForceUpdateRemoteDecision data =
//               sn.data as ForceUpdateRemoteDecision;
//               return UpdateWidget(
//                 transparentBackground: true,
//                 backgroundColor: Colors.red,
//                 logo: Image.network("https://picsum.photos/200"),
//                 message: data.message ?? "New version available",
//                 textColor: Colors.purple,
//                 updateButton: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                   child: MyButton(
//                     text: "Update Now",
//                   ),
//                 ),
//                 skipButton: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                   child: MyButton(
//                     text: "Skip",
//                   ),
//                 ), isPriorityHigh: data.isMajor ?? false,);
//             }
//             return Text("Loading");
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class MyButton extends StatelessWidget {
//   final String text;
//
//   const MyButton({Key? key, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.red, child: Text(text));
//   }
// }
