import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap:(){
            Get.back();   //basically the button for going on back Music bag homepage from songcontrollerbutton
          },
          child: Container(
            width: 40,height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: divColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SvgPicture.asset("assets/icons/back_page.svg"),
            ),
          ),
        ),
        Container(
          width: 40,height: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: divColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset("assets/icons/setting.svg"),
          ),
        ),

      ],
    );
  }
}
