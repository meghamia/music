import 'package:flutter/material.dart';
import 'package:flutter_project/components/songHeader.dart';
import 'package:flutter_project/components/songTile.dart';
import 'package:flutter_project/components/trendingSongSlider.dart';
import 'package:flutter_project/config/colors.dart';
import 'package:flutter_project/controllers/cloudSongController.dart';
import 'package:flutter_project/controllers/songDataController.dart';
import 'package:flutter_project/controllers/songPlayerController.dart';
import 'package:flutter_project/screens/playSongPage.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SongPageHeader(),
                const SizedBox(
                  height: 20,
                ),
                const TrendingSongSlider(),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            songDataController.isDeviceSong.value = false;
                          },
                          child: Text(
                            "Cloud Song",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? lableColor
                                      : primaryColor,
                                ),
                          )),
                      InkWell(
                          onTap: () {
                            songDataController.isDeviceSong.value = true;
                          },
                          child: Text(
                            "Device Song",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: songDataController.isDeviceSong.value
                                      ? primaryColor
                                      : lableColor,
                                ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => songDataController.isDeviceSong.value
                    ? Column(
                        children: songDataController.localSongList.value
                            .map((e) => SongTile(
                                  onPress: () {
                                    songPlayerController.playLocalAudio(e);
                                    songDataController
                                        .findCurrentSongPlayingIndex(e.id);
                                    Get.to(
                                        PlaySongPage()); //i am handling the playing song button from here
                                  },
                                  songName: e.title,
                                ))
                            .toList())
                    : Column(
                        children: cloudSongController.cloudSongList.value.map((e)=>SongTile(
                          onPress: () {
                            songPlayerController.playCloudAudio(e);
                            songDataController
                                .findCurrentSongPlayingIndex(e.id!);
                            Get.to(
                                PlaySongPage()); //i am handling the playing song button from here
                          },
                          songName: e.title!,
                        )).toList(),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
