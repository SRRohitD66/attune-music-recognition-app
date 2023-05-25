import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'song_screens.dart';
import 'package:attune/viewmodels/home_vm.dart';




class HomePage extends HookConsumerWidget   {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final vm = ref.watch(homeViewModel);
    ref.listen<HomeViewModel>(homeViewModel, (previous, next) {
      print('be here');
      print(vm.success);

        if(vm.success) {
          print('I am inside listen');
          print('I am here');

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SongScreen(
                        song: vm.currentSongs,artist: vm.names,
                      )));
        }
    });

    return  Scaffold(
        backgroundColor: Color(0xFF042442),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tap to Attune',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 20,),
              AvatarGlow(
                endRadius: 200,
                animate: vm.isRecognizing,
                child: GestureDetector(
                  onTap: ()=>{vm.isRecognizing
                      ? vm.stopRecognizing()
                      : vm.startRecognizing()
                  },
                  child: Material(
                    shape: CircleBorder(),
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF089af8),

                      ),
                      child: Image.asset('images/attuneNew.png',color: Colors.white,),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      );
  }
}
