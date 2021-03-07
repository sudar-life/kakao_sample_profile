import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_sample_profile/src/app.dart';
import 'package:kakao_sample_profile/src/controller/image_crop_controller.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ImageCropper',
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      home: App(),
    );
  }
}
