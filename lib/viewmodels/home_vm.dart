import 'package:attune/services/models/spotify_song_model.dart';
import 'package:attune/services/song_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';


class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    initAcr();
  }
  final AcrCloudSdk acr = AcrCloudSdk();
  final songService = SongService();
  late String currentSongs,currentSongsd,currentsongsy;
  late String names,named,namey;
  bool isRecognizing = false;
  bool success = false;

  Future<void> initAcr() async {
    try {
      acr
        ..init(
            host: 'identify-ap-southeast-1.acrcloud.com',
            accessKey: 'e9610c9633e80e8bf062d75af7ff379e',
            accessSecret: 'GekkG3PzpC2qvKjRemcsyHTeEtEzIN8iSgBkhLbz',
            setLog: true)
        ..songModelStream.listen(searchSong);


    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    //print(song);
    final success1 = song.status?.msg;
   // print("*******************************************************************************");

      if(success1=="Success") {
        final trackID = song.metadata?.music?[0].externalMetadata?.spotify?.track?.name;
       final artists=song.metadata?.music?[0].artists?[0].name;
       // final you_trackid=song.metadata?.music?[0].externalMetadata?
        print(trackID);
        try {
          print(
              '*********************************************************************************');
          print(trackID);

          names=artists.toString();
          print(names);

          currentSongs = trackID.toString();
          success = true;

          notifyListeners();
        } catch (e) {
          isRecognizing = false;
          success = false;
          notifyListeners();
        }
      }

  }
  Future<void> startRecognizing()async{
    isRecognizing=true;
    success=false;
    print('recording started');
    notifyListeners();
    try{
      await acr.start();

    }
    catch(e)
    {
      print(e.toString());

    }


  }
  Future<void> stopRecognizing()async{
    isRecognizing=false;
    success=false;
    notifyListeners();
    try{
      await acr.stop();
      print('recordimng ended');
    }
    catch(e)
    {
      print(e.toString());

    }


  }
}

final homeViewModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  print('>> IN Homeviemodel');
  return HomeViewModel();
});
