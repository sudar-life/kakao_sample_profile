import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';

class ImageCropController extends GetxController {
  static ImageCropController get to => Get.find();

  Future<File?> selectImage(ProfileImageType type) async {
    var pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile == null) return null;
    return await _cropImage(pickedFile.path, type);
  }

  Future<File?> _cropImage(String? path, ProfileImageType type) async {
    List<CropAspectRatioPreset> presets = [];
    switch (type) {
      case ProfileImageType.THUMBNAIL:
        presets = [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
        ];
        break;
      case ProfileImageType.BACKGROUND:
        presets = [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
        ];
        break;
    }
    var croppedFile = await ImageCropper.cropImage(
        sourcePath: path!,
        aspectRatioPresets: presets,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    return croppedFile;
  }
}
