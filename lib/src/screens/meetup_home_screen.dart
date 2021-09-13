// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_element, annotate_overrides, prefer_final_fields, deprecated_member_use, avoid_print

// import 'package:flutter/material.dart';
// import '../widgets/BottomNavigation.dart';

// class HomeScreen extends StatefulWidget {
//   final String _title;

//   HomeScreen({required String title}) : _title = title;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }




// class _HomeScreenState extends State<HomeScreen> {
//   int _counter = 0;
//   _increment() {
//     print('iam clicking float button');
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(widget._title),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // ignore: prefer_const_literals_to_create_immutables
//           children: [
//             Text(
//               'welcom $widget.title,lets Increment Number',
//               textDirection: TextDirection.ltr,
//               style: TextStyle(fontSize: 17),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text('Click  Counter: $_counter',
//                 //textDirection: TextDirection.ltr,
//                 style: TextStyle(fontSize: 30.0)),
//             RaisedButton(
//                 child: Icon(Icons.access_alarms),
//                 onPressed: () => Navigator.pushNamed(context, "/meetupDetail"))
//           ],
//         ),
//       ),

//       floatingActionButton: FloatingActionButton(
//           onPressed: _increment, tooltip: 'Increment', child: Icon(Icons.add)),
//       bottomNavigationBar: BottomNavigation(),

//       //test page
//     );
//   }
// }
//buat latihan gak dipake!