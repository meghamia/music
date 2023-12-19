import 'package:flutter_project/model/MySongModel.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isLoop = false.obs;
  RxBool isShuffled = false.obs;
  RxDouble volumeLevel = 0.2.obs;


  //from here i can play the songs
  void playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data),
      ),
    );
    player.play();
    updatePosition(); //calling this function here k jaise hi song play ho hamari possition update hona start ho jaye
    isPlaying.value = true;
  }



  void playCloudAudio(MySongModel song) async {
    songTitle.value = song.title!;
    songArtist.value = song.artist!;
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(song.data!),
      ),
    );
    player.play();
    updatePosition(); //calling this function here k jaise hi song play ho hamari possition update hona start ho jaye
    isPlaying.value = true;
  }




  void changeVolume(double volume){
    volumeLevel.value = volume;
    player.setVolume(volumeLevel.value);
    print(volumeLevel.value);

  }

  void setLoopSong() async{
    if(isLoop.value){
      await player.setLoopMode(LoopMode.off);
    }else{
      await player.setLoopMode(LoopMode.one);
    }

    isLoop.value = !isLoop.value;

}


void playRandomSong() async{
   if(isShuffled.value){
     await player.setShuffleModeEnabled(false);
   }
   else{
     await player.setShuffleModeEnabled(true);
   }
   isShuffled.value = !isShuffled.value;
}

//from where the song has stopped it starts from there means resume there...
  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  //from here i can pause the songs
  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

//somg willl move to that position from where the song will resume or start..
  void changeSongSlider(Duration position){
    player.seek(position);

  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxValue.value = d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p) {
        currentTime.value = p.toString().split(".")[0];
        sliderValue.value = p.inSeconds.toDouble();
      });
    } catch (e) {
      print(e);
    }
  }
}
