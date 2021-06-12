import 'package:flutter/material.dart';
import 'package:mapdemo/animation/ani_example.dart';
import 'package:mapdemo/animation/pulse_animation.dart';
import 'package:mapdemo/animation/wave_animation.dart';
import 'package:mapdemo/logic/business_logic.dart';
import 'package:mapdemo/screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:background_location/background_location.dart';
// import 'package:background_fetch/background_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'dart:convert';





// const EVENTS_KEY = "fetch_events";


// /// This "Headless Task" is run when app is terminated.
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   var taskId = task.taskId;
//   var timeout = task.timeout;
//   if (timeout) {
//     print("[BackgroundFetch] Headless task timed-out: $taskId");
//     BackgroundFetch.finish(taskId);
//     return;
//   }

//   print("[BackgroundFetch] Headless event received: $taskId");
//   var timestamp = DateTime.now();

//   var prefs = await SharedPreferences.getInstance();

//   // Read fetch_events from SharedPreferences
//   var events = <String>[];
//   var json = prefs.getString(EVENTS_KEY);
//   if (json != null) {
//     events = jsonDecode(json).cast<String>();
//   }
//   // Add new event.
//   events.insert(0, "$taskId@$timestamp [Headless]");
//   // Persist fetch events in SharedPreferences
//   prefs.setString(EVENTS_KEY, jsonEncode(events));

//   if (taskId == 'flutter_background_fetch') {
//     BackgroundFetch.scheduleTask(TaskConfig(
//         taskId: "com.transistorsoft.customtask",
//         delay: 5000,
//         periodic: false,
//         forceAlarmManager: false,
//         stopOnTerminate: false,
//         enableHeadless: true
//     ));
//   }
//   BackgroundFetch.finish(taskId);
// }



void main() {
   WidgetsFlutterBinding.ensureInitialized();
   runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider.value(value: AppState())
      ],
        child: MyApp(),)
  );
  //  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:
      AnimationExample()
      // MyAnimatedWaveCurves()
      // SpriteDemo()
      // BackFetch()
      //  LandingPage(),
    );
  }
}








// class BackLoc extends StatefulWidget {
//   @override
//   _BackLocState createState() => _BackLocState();
// }



// class _BackLocState extends State<BackLoc> {
//   String latitude = 'waiting...';
//   String longitude = 'waiting...';
//   String altitude = 'waiting...';
//   String accuracy = 'waiting...';
//   String bearing = 'waiting...';
//   String speed = 'waiting...';
//   String time = 'waiting...';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Scaffold(
//         appBar: AppBar(
//           title: const Text('Background Location Service'),
//         ),
//         body: Center(
//           child: ListView(
//             children: <Widget>[
//               locationData('Latitude: ' + latitude),
//               locationData('Longitude: ' + longitude),
//               locationData('Altitude: ' + altitude),
//               locationData('Accuracy: ' + accuracy),
//               locationData('Bearing: ' + bearing),
//               locationData('Speed: ' + speed),
//               locationData('Time: ' + time),
//               ElevatedButton(
//                   onPressed: () async {
//                     await BackgroundLocation.setAndroidNotification(
//                       title: 'Background service is running',
//                       message: 'Background location in progress',
//                       icon: '@mipmap/ic_launcher',
//                     );
//                     //await BackgroundLocation.setAndroidConfiguration(1000);
//                     await BackgroundLocation.startLocationService(
//                         distanceFilter: 20);
//                     BackgroundLocation.getLocationUpdates((location) {
//                       setState(() {
//                         latitude = location.latitude.toString();
//                         longitude = location.longitude.toString();
//                         accuracy = location.accuracy.toString();
//                         altitude = location.altitude.toString();
//                         bearing = location.bearing.toString();
//                         speed = location.speed.toString();
//                         time = DateTime.fromMillisecondsSinceEpoch(
//                                 location.time.toInt())
//                             .toString();
//                       });
//                       print('''\n
//                         Latitude:  $latitude
//                         Longitude: $longitude
//                         Altitude: $altitude
//                         Accuracy: $accuracy
//                         Bearing:  $bearing
//                         Speed: $speed
//                         Time: $time
//                       ''');
//                     });
//                   },
//                   child: Text('Start Location Service')),
//               ElevatedButton(
//                   onPressed: () {
//                     BackgroundLocation.stopLocationService();
//                   },
//                   child: Text('Stop Location Service')),
//               ElevatedButton(
//                   onPressed: () {
//                     getCurrentLocation();
//                   },
//                   child: Text('Get Current Location')),
//             ],
//           ),
//         ),
    
//     );
//   }

//   Widget locationData(String data) {
//     return Text(
//       data,
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 18,
//       ),
//       textAlign: TextAlign.center,
//     );
//   }

//   void getCurrentLocation() {
//     BackgroundLocation().getCurrentLocation().then((location) {
//       print('This is current Location ' + location.toMap().toString());
//     });
//   }

//   @override
//   void dispose() {
//     BackgroundLocation.stopLocationService();
//     super.dispose();
//   }
// }
 







// class BackFetch extends StatefulWidget {
//   @override
//   _BackFetchState createState() => new _BackFetchState();
// }

// class _BackFetchState extends State<BackFetch> {
//   bool _enabled = true;
//   int _status = 0;
//   List<String> _events = [];

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     // Load persisted fetch events from SharedPreferences
//     var prefs = await SharedPreferences.getInstance();
//     var json = prefs.getString(EVENTS_KEY);
//     if (json != null) {
//       setState(() {
//         _events = jsonDecode(json).cast<String>();
//       });
//     }

//     // Configure BackgroundFetch.
//     try {
//       var status = await BackgroundFetch.configure(BackgroundFetchConfig(
//         minimumFetchInterval: 15,
//         forceAlarmManager: false,
//         stopOnTerminate: false,
//         startOnBoot: true,
//         enableHeadless: true,
//         requiresBatteryNotLow: false,
//         requiresCharging: false,
//         requiresStorageNotLow: false,
//         requiresDeviceIdle: false,
//         requiredNetworkType: NetworkType.NONE,
//       ), _onBackgroundFetch, _onBackgroundFetchTimeout);
//       print('[BackgroundFetch] configure success: $status');
//       setState(() {
//         _status = status;
//       });

//       // Schedule a "one-shot" custom-task in 10000ms.
//       // These are fairly reliable on Android (particularly with forceAlarmManager) but not iOS,
//       // where device must be powered (and delay will be throttled by the OS).
//       BackgroundFetch.scheduleTask(TaskConfig(
//           taskId: "com.transistorsoft.customtask",
//           delay: 10000,
//           periodic: false,
//           forceAlarmManager: true,
//           stopOnTerminate: false,
//           enableHeadless: true
//       ));

//     } catch(e) {
//       print("[BackgroundFetch] configure ERROR: $e");
//       setState(() {
//         _status = e;
//       });
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//   }

//   void _onBackgroundFetch(String taskId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     DateTime timestamp = new DateTime.now();
//     // This is the fetch-event callback.
//     print("[BackgroundFetch] Event received: $taskId");
//     setState(() {
//       _events.insert(0, "$taskId@${timestamp.toString()}");
//     });
//     // Persist fetch events in SharedPreferences
//     prefs.setString(EVENTS_KEY, jsonEncode(_events));

//     if (taskId == "flutter_background_fetch") {
//       // Schedule a one-shot task when fetch event received (for testing).
//       /*
//       BackgroundFetch.scheduleTask(TaskConfig(
//           taskId: "com.transistorsoft.customtask",
//           delay: 5000,
//           periodic: false,
//           forceAlarmManager: true,
//           stopOnTerminate: false,
//           enableHeadless: true,
//           requiresNetworkConnectivity: true,
//           requiresCharging: true
//       ));
//        */
//     }
//     // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
//     // for taking too long in the background.
//     BackgroundFetch.finish(taskId);
//   }

//   /// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
//   void _onBackgroundFetchTimeout(String taskId) {
//     print("[BackgroundFetch] TIMEOUT: $taskId");
//     BackgroundFetch.finish(taskId);
//   }

//   void _onClickEnable(enabled) {
//     setState(() {
//       _enabled = enabled;
//     });
//     if (enabled) {
//       BackgroundFetch.start().then((int status) {
//         print('[BackgroundFetch] start success: $status');
//       }).catchError((e) {
//         print('[BackgroundFetch] start FAILURE: $e');
//       });
//     } else {
//       BackgroundFetch.stop().then((int status) {
//         print('[BackgroundFetch] stop success: $status');
//       });
//     }
//   }

//   void _onClickStatus() async {
//     int status = await BackgroundFetch.status;
//     print('[BackgroundFetch] status: $status');
//     setState(() {
//       _status = status;
//     });
//   }

//   void _onClickClear() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove(EVENTS_KEY);
//     setState(() {
//       _events = [];
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     const EMPTY_TEXT = Center(child: Text('Waiting for fetch events.  Simulate one.\n [Android] \$ ./scripts/simulate-fetch\n [iOS] XCode->Debug->Simulate Background Fetch'));

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             title: const Text('BackgroundFetch Example', style: TextStyle(color: Colors.black)),
//             backgroundColor: Colors.amberAccent,
//             brightness: Brightness.light,
//             actions: <Widget>[
//               Switch(value: _enabled, onChanged: _onClickEnable),
//             ]
//         ),
//         body: (_events.isEmpty) ? EMPTY_TEXT : Container(
//           child: ListView.builder(
//               itemCount: _events.length,
//               itemBuilder: (BuildContext context, int index) {
//                 List<String> event = _events[index].split("@");
//                 return InputDecorator(
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
//                         labelStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
//                         labelText: "[${event[0].toString()}]"
//                     ),
//                     child: Text(event[1], style: TextStyle(color: Colors.black, fontSize: 16.0))
//                 );
//               }
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//             child: Container(
//                 padding: EdgeInsets.only(left: 5.0, right:5.0),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       RaisedButton(onPressed: _onClickStatus, child: Text('Status: $_status')),
//                       RaisedButton(onPressed: _onClickClear, child: Text('Clear'))
//                     ]
//                 )
//             )
//         ),
//       ),
//     );
//   }
// }
