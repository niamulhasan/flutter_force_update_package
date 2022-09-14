// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
//
// class MyApp extends StatefulWidget {
//   // const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//           children: [
//             YourMainApp(),
//             FutureBuilder(
//               future: ForceUpdateUtils.getRemoteUpdateStatus("https://62b43f19530b26da4cb9fcc0.mockapi.io/check-update"),
//               builder: (context, AsyncSnapshot<ForceUpdateRemoteData?> snapshot){
//                 if(snapshot.hasData && snapshot.data != null){
//                   return ForceUpdatePrompt(
//                     androidVersionName: snapshot.data!.androidVersionName,
//                     androidVersionCode: snapshot.data!.androidVersionCode,
//                     iosVersionName: snapshot.data!.iosVersionName,
//                     iosVersionCode: snapshot.data!.iosVersionCode,
//                     androidPriorityIsHigh: snapshot.data!.androidPriorityIsHigh,
//                     iosPriorityIsHigh: snapshot.data!.iosPriorityIsHigh,
//                     backgroundColor: Colors.purple,
//                     logo: Image.asset("asset/new/icon_app.png"),
//                     transparentBackground: true,
//                     message: snapshot.data!.message ?? "New version available",
//                     updateButton: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                       child: MyButton(
//                         text: "Update Now",
//                       ),
//                     ),
//                     skipButton: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                       child: MyButton(
//                         text: "Skip",
//                       ),
//                     ),
//                   );
//                 }
//                 return const Center(child: CircularProgressIndicator());
//               } ,
//             ),
//           ],
//     );
//   }
//
//
// }
