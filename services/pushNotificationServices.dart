// // import 'dart:html';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging();

//   Future initialise() async{
//     if (Platform.isIOS){
//       // request permissions if were on andriod
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//     _fcm.configure(
//       // called when the app is in the forground and we receive a push notification
//       onMessage: (Map<String, dynamic> message) async{
//         print('onMessage: $message');
//       },
//       // called when the app has been closed completely and its opened
//       // from the push notification directly
//       onLaunch: (Map<String, dynamic> message) async{
//         print('onMessage: $message');
//       },
//       // called when the app is in the background and its opened 
//       // from the push notification
//       onResume: (Map<String, dynamic> message) async{
//         print('onMessage: $message');
//       }
//     );
//   }
// }