import 'package:flutter/material.dart';
import 'package:flutter_project/config/colors.dart';
import 'package:flutter_project/controllers/songPlayerController.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SongAndVolume extends StatelessWidget {
  const SongAndVolume({super.key});





  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Obx(() => SfRadialGauge(
      animationDuration: 1,
      enableLoadingAnimation: true,
      axes: [
        RadialAxis(
          useRangeColorForAxis: true,
          startAngle: 0,
          endAngle: 180,
          canRotateLabels: false,
          interval: 10,
          isInversed: true,
          maximum: 1,
          minimum: 0,
          showAxisLine: true,
          showLabels: false,
          showTicks: true,
          ranges: [
            GaugeRange(
              startValue: 0,
              endValue: songPlayerController.volumeLevel.value,
              color: primaryColor,
            ),
          ],
          pointers: [
            MarkerPointer(
              color: primaryColor,
              borderWidth: 20,
              value: songPlayerController.volumeLevel.value,
              onValueChanged: (value) {
                songPlayerController.changeVolume(value);

              },
              enableAnimation: true,
              enableDragging: true,
              markerType: MarkerType.circle,
              markerWidth: 20,
              markerHeight: 20,
            ),
          ],
          annotations: [
            GaugeAnnotation(
              horizontalAlignment: GaugeAlignment.center,
              widget: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/cover.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(1000),
                  color: divColor,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}











