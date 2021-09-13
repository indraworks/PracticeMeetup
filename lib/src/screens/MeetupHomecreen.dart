// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, avoid_print, avoid_types_as_parameter_names, prefer_equal_for_default_values, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, empty_statements, unused_local_variable, unnecessary_this, prefer_const_constructors_in_immutables, annotate_overrides

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/meetup.dart';
import 'package:practice_meetup/src/services/meetup_api_service.dart';

class MeetupHomeScreen extends StatefulWidget {
  //instansiate variable class API
  MeetupService _api = MeetupService();

  @override
  _MeetupHomeScreenState createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  //declare var list meetup utk diisi
  List<Meetup> meetups = [];

  //initstate call _fetchmeetup
  @override
  initState() {
    super.initState();
    _fetchMeetups();
  }

  _fetchMeetups() async {
    final meetupsData = await widget._api.fetchMeetups();
    //update state
    setState(() => this.meetups = meetupsData);
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
          _MeetupTitle(),
          _MeetupList(meetups: meetups),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}

//bab 8 meetupCard diganti private _MeetupTitle
//dimana _MeetupTitle punya list didalamnya ada _MeetupCard (individu2)
//dimana MeeetupCard ini ditaruh di ListView di  _MEetupTitle!

class _MeetupTitle extends StatelessWidget {
  //const MeetupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Featured Meetup',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _MeetupCard extends StatelessWidget {
  final Meetup meetup;
  //constructor pasing meetupList perindex

  @override
  _MeetupCard({required this.meetup});
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(meetup.image),
          ),
          title: Text(meetup.title),
          subtitle: Text(meetup.description),
        ),
        //make it buttonbar only depreacted the ButtonTheme.bar!
        ButtonBar(
          children: [
            TextButton(
              child: Text(
                'Visit Meetup',
              ),
              onPressed: () {},
            ),
            FlatButton(onPressed: () {}, child: Text('Favorite'))
          ],
        )
      ],
    ));
  }
}

//_MeetupList
class _MeetupList extends StatelessWidget {
  //var local list meetup
  final List<Meetup> meetups;

  //meetups yg didapat dari api di jadikan param di cosntructor
  
  _MeetupList({required this.meetups});

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: meetups.length * 2,
          itemBuilder:
              //itembuilder adalah looping widget yg mau dibuat listnya
              (BuildContext context, int i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2;
            //rendernya berupa tiap2 index dari widget  meetupCardList
            return _MeetupCard(meetup: meetups[index]);
          }),
    );
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

/*
delete widget CustomText
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
//delete class stf _CustomTextState
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


*/
