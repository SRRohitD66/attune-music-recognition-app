import 'package:dio/dio.dart';
import 'package:attune/services/models/spotify_song_model.dart';

class SongService{
  late Dio _dio;
  // SongService(){
  //   BaseOptions options=BaseOptions(
  //     connectTimeout: Duration(milliseconds:100000 ),
  //     receiveTimeout: Duration(milliseconds:100000 ),
  //     baseUrl: 'https://api.spotify.com/v1/tracks/');
  //   _dio=Dio(options);
  //
  // }
  Future<SpotifySongModel> getTrack(id) async{
    print('**********************************&***************************$id');
    try{
      final response=await _dio.get('https://api.spotify.com/v1/tracks/$id');
      print('**********************************&&&&&&&&&&&&&&&&***************************');
      SpotifySongModel result = SpotifySongModel.fromJson(response.data);

      return result;

    } on DioError catch(e){
      if(e.requestOptions!=null)
        throw 'An error has occured';
      else{
        print(e.error);
        throw e;
      }
    }

  }
}