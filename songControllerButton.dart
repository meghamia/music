import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/colors.dart';
import 'package:flutter_project/controllers/songDataController.dart';
import 'package:flutter_project/controllers/songPlayerController.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

//basically for play or pause area
class SongControllerButtons extends StatelessWidget {
  const SongControllerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${songPlayerController.currentTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Obx(
                  () => Slider(
                    value: songPlayerController.sliderValue.value
                        .clamp(0.0, songPlayerController.sliderValue.value),
                    onChanged: (value) {
                      songPlayerController.sliderValue.value = value;

                      Duration songPosition = Duration(seconds: value.toInt());   //change the song position in time basically
                      songPlayerController.changeSongSlider(songPosition);
                    },
                    min: 0,
                    max: songPlayerController.sliderMaxValue.value,
                  ),
                ),
              ),
              Text(
                "${songPlayerController.currentTime}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                songDataController.playPreviousSong();
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                width: 25,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Obx(
              () => songPlayerController.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/pause.svg",
                            width: 25,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/play.svg",
                            width: 25,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: (){
                songDataController.playNextSong();
              },
              child: SvgPicture.asset(
                "assets/icons/next.svg",
                width: 25,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 55,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                songPlayerController.playRandomSong();
              },
              child: Obx(() => SvgPicture.asset(
                "assets/icons/suffle.svg",
                width: 18,
                color: songPlayerController.isShuffled.value ? primaryColor : lableColor,
              ),),
            ),
            InkWell(
              onTap: (){
                songPlayerController.setLoopSong();
              },
              child: Obx(() => SvgPicture.asset(
                "assets/icons/repeat.svg",
                width: 18,
                color: songPlayerController.isLoop.value ? primaryColor : lableColor,
              ),),
            ),
            SvgPicture.asset(
              "assets/icons/songbook.svg",
              width: 18,
            ),
            SvgPicture.asset(
              "assets/icons/heart.svg",
              width: 18,
            ),
          ],
        ),
      ],
    );
  }
}
