import 'package:flutter/material.dart';
import 'package:attune/services/models/spotify_song_model.dart';
import 'package:attune/viewmodels/bottom_button.dart';
import 'package:attune/viewmodels/constants.dart';
import 'package:url_launcher/url_launcher.dart';


class SongScreen extends StatefulWidget {

  SongScreen({required this.song,required this.artist});
   late String song;
  final String artist;

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late final Uri _url;// = Uri.parse('https://www.youtube.com/results?search_query=${widget.song}');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    _url = Uri.parse('https://www.youtube.com/results?search_query=${widget.song}');
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(


      child:DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage('images/SongScreen.png'),fit: BoxFit.cover),


        ),


        child: Scaffold(
          appBar: AppBar(leading:Icon(Icons.accessibility),title: Text('Match Found',),centerTitle: true,backgroundColor: Colors.blueAccent,),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[

    Expanded(
    flex: 5,

    child:  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

    children: [
    Text(widget.song,style: klargeButtonText,),
    Text(widget.artist,style:klargeButtonText,),
      ElevatedButton(
        onPressed: _launchUrl,
        child: Text('Go to You Tube'),
      ),

    ],
    ),
    ),
                BottomButton(
                  name: 'Re- Attune',
                  press: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
