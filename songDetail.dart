import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/songPlayerController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/icons/play_outline.svg"),
            SizedBox(width: 20),
            Text(
              "210 plays",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        //SizedBox(height: 1,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Obx(() => Text(
                  "${songPlayerController.songTitle.value}",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),),
            ),
            SvgPicture.asset(
              "assets/icons/download.svg",
              width: 25,
            ),
          ],
        ),
        SizedBox(
          height: 1,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${songPlayerController.songArtist.value}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
