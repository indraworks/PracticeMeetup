// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class MeetupHomeScreen extends StatefulWidget {
  const MeetupHomeScreen({Key? key}) : super(key: key);

  @override
  _MeetupHomeScreenState createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  List<CustomText> customTextList = [
    CustomText(name: '1'),
    CustomText(name: '2'),
    CustomText(name: '3'),
  ];
  _shuffleList() {
    setState(() {
      customTextList.shuffle(); //suffle ini utk pngambilan random
      customTextList.forEach((e) => print(e.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Home"),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Column(
            children: customTextList,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleList,
      ),
    );
  }
}

//Widget CustomText
class CustomText extends StatefulWidget {
  final String name;
  //buat constructor utk porperty nama pada saat isntansiate class CustomText
  const CustomText({required this.name});

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  List colors = [
    Colors.red,
    Colors.blue,
    Colors.brown,
    Colors.purple,
    Colors.yellow
  ];
  Random random = Random(); //instansiate random
  late Color color; //declare variable color
  @override
  void initState() {
    super.initState();
    color = colors[random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text('Custom Text of $color'), color: color, height: 150);
  }
}


/*
Keys 1:
Belajar Foreach pada widget  



*/