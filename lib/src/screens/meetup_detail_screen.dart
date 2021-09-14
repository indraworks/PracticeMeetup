// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, annotate_overrides, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_null_comparison, must_be_immutable

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/meetup.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';
import 'package:practice_meetup/src/services/meetup_api_service.dart';
//fetch meetup by id di detail_screen ambil /fetch based id dari server
//ubah dulu  stl ke stf stlahhnya update statenya krn stte hnya ada di stful

class MeetupDetailScreen extends StatefulWidget {
  static final String route = '/meetupDetail';
  late String meetupId;
  final MeetupService api = MeetupService(); //instasiate api
  //construct
  MeetupDetailScreen({required this.meetupId});

  @override
  State<MeetupDetailScreen> createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {
  //tmpat olah state di namaclass"state"
  //buat variable meetup bertipe Meetup class Model
  late Meetup meetup;

  initState() {
    super.initState();
    _fetchMeetup();
  }

  void _fetchMeetup() async {
    //feetchMeetupsById adalah metode dari MeetupService ,dibuat dulu trus kita panggil
    final meetup = await widget.api.fetchMeetupById(widget.meetupId);
    print(meetup.title);
    print(meetup.description);
    //jgn lupa update statenya klo udah dapat datanya!!!
    setState(() => this.meetup = meetup
        //data dari api,var meetup dimasukan kedlm var model meetup,atau dgn katalain ubah statenya
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Meetup Detail'),
        ),
      ),
      body: meetup != null
          ? ListView(
              children: <Widget>[
                HeaderSection(meetup: meetup),
                TitleSection(meetup: meetup),
                AdditionalSection(meetup: meetup),
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                        'Alps. Situated 1,578 meters above sea level, it is one of the '
                        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                        'half-hour walk through pastures and pine forest, leads you to the '
                        'lake, which warms to 20 degrees Celsius in the summer. Activities '
                        'enjoyed here include rowing, and riding the summer toboggan run.'),
                  ),
                )
              ],
            )
          : Container(width: 0, height: 0),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  Meetup? meetup; //buat variable dari Meetup Model Class bernama meetup
  //construct
  HeaderSection({required this.meetup});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.network(meetup!.image,
            width: width, height: 240, fit: BoxFit.cover),
        Container(
          width: width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ListTile(
                leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://cdn1.vectorstock.com/i/thumb-large/82/55/anonymous-user-circle-icon-vector-18958255.jpg')),
                title: Text(meetup!.title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent))),
          ),
        ),
        //buat
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  Meetup? meetup;

  TitleSection({required this.meetup});

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(meetup!.title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(meetup!.shortInfo,
                      style: TextStyle(color: Colors.grey[500]))
                ],
              ),
            ),
            Icon(Icons.people, color: Colors.blue[500]),
            Text('${meetup!.joinedPeopleCount} People')
          ],
        ));
  }
}

class AdditionalSection extends StatelessWidget {
  Meetup? meetup;
  AdditionalSection({required this.meetup});
  //buat function buildcolumn yg masing2 passing  label,text,color
  //disini ada 3 colum judul Category,waktu from,watu To/end
  String _capitalize(String word) {
    return (word != null && word.isNotEmpty)
        ? word[0].toUpperCase() + word.substring(1)
        : "";
  }

  _buildColumn(String label, String text, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 13.0, fontWeight: FontWeight.w400, color: color),
        ),
        Text(
          _capitalize(text),
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.w500, color: color),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //warna color ikut warna theme
    Color color = Theme.of(context).primaryColor;
    return Row(
      //pake row didalamnya berjajar 3 column
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildColumn('CATEGORY', meetup!.category.name, color),
        _buildColumn('START', meetup!.timeFrom, color),
        _buildColumn('FROM', meetup!.timeTo, color)
      ],
    );
  }
}




/*
Ada Error knpa bisa eror ya karena di _MeetuDetailScreenState kita declare variable Meetup meetup
isinya masih undefined nul tidak ada waktu masih restart,saat trima blum trima api
pada saat ada push dari HomeScren di push kondisi Meetup meetup msih blum ada data
nah dia masuk langsug ke headerSection ngerender image makanya hasilnya error 
utk itu kita harus kasih jeda dan if then else /check kalau Meetup meetup ini masih null atau suadh trisi data api
jika masih null maka munculkan coontainer wdth 0 dan height null 
jika ada sudah trisi api ,data meetupnya pasing e HeaderSection (meetup)
ok??:D



*/

/*
contoh buat inisialisasi
You can change it to :

MyData data = MyData(); //by initializing it.
//or by making it nullable.
MyData? data;


*/