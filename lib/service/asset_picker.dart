import 'dart:io' as io;

import 'package:flutter/widgets.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

abstract class AssetsPicker {
  Future<io.File> cameraImage(BuildContext context);
  galleryImage();
}

class AssetsPickerImpl implements AssetsPicker {
  @override
  Future<io.File> cameraImage(BuildContext context) async {
    AssetEntity assetEntity = await CameraPicker.pickFromCamera(
      context,
      isAllowRecording: false,
      textDelegate: EnglishCameraPickerTextDelegate(),
    );

    return assetEntity.file;
  }

  @override
  galleryImage() {
    // TODO: implement galleryImage
    throw UnimplementedError();
  }
}
