import 'package:flutter/material.dart';
import 'package:flutter_project/components/playSongHeaderButton.dart';
import 'package:flutter_project/components/songAndVolume.dart';
import 'package:flutter_project/components/songControllerButton.dart';
import 'package:flutter_project/components/songDetail.dart';
import 'package:flutter_project/components/songWave.dart';
import 'package:flutter_project/screens/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaySongPage extends StatelessWidget {

  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 20.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              PlaySongHeaderButton(),
              SizedBox(
                height: 10,
              ),
              SongAndVolume(),
              SizedBox(
                height: 0,
              ),
              SongDetails(

              ),
              SizedBox(
                height: 20,
              ),
              // SongWave(),
              // SizedBox(height: 10,),
              Spacer(),
              SongControllerButtons(),

              SizedBox(
                height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
