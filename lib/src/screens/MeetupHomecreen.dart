// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, avoid_print, avoid_types_as_parameter_names, prefer_equal_for_default_values, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

class MeetupHomeScreen extends StatefulWidget {
  @override
  _MeetupHomeScreenState createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  List<CustomText> customTextList = [
    CustomText(key: UniqueKey(), name: '1'),
    CustomText(key: UniqueKey(), name: '2'),
    CustomText(key: UniqueKey(), name: '3'),
    CustomText(key: UniqueKey(), name: '4')
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
  //const CustomText({required this.name}); old
  //kita buat disini utk keys pada constrcutornya!
  const CustomText({Key? key, required this.name}) : super(key: key);
  //artiny buat param key yg bertypedata Key -->trus pasing ke rootclass variable
  //lewat parameter key yaitu  super(key:key)
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
Keys part 2
Jadi gini pada diatas kita buat random utk stiap container warnanya berubah2 selalu random
pemakaian next integer itu berdasarkan utk counter random dari colorlist (spnjajang maksimal mak lenght)
nah integernya nagka berubah2  1,2,3  ->3,1,2 ngeshift nah tetapi si color gak berubah2
utk itu di parent class kita kasih key pada customTextList 
 List<CustomText> customTextList =
  [CustomText(key: UniqueKey(), name: '1'),
   CustomText(key: UniqueKey(), name: '2'), 
   CustomText(key: UniqueKey(), name: '3')]; 

nah sekarang di widget class anak  class _CustomTextState,
pada konstruktornya kita wajib utk buat key !yg menunu pada parent ,
jangan lupa pake super(key:key) krn kita ubah parent class


*/