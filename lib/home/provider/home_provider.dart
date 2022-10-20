import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as IMG;
import 'package:image/image.dart' as DEC;
import 'package:image/image.dart' as CPY;
// import 'package:image/image.dart';
import 'package:video_utility/GIF/screen/images_to_gif.dart';


class HomeProvider extends ChangeNotifier {
  final IMG.JpegDecoder decoder = IMG.JpegDecoder();


  // void decodeImages(Uint8List data){
  //   // gifProvider.images.add(decoder.decodeImage(data));
  //   var image = DEC.decodeJpg(File.fromRawPath(data).readAsBytesSync());
  //
  //   // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  //   var thumbnail = CPY.copyResize(image!, width: 120);
  //
  //   // Save the thumbnail as a PNG.
  //   File.fromRawPath(data).writeAsBytesSync(DEC.encodeGif(image));
  // }

/*Future<dynamic> openCameraImages() async {
    // XFile file;
    if (await PermissionUtils().requestPermission(Permission.storage) &&
            await PermissionUtils().requestPermission(Permission
                .accessMediaLocation) */
  /*&&
            await _requestPermission(Permission.manageExternalStorage)*/
  /*
        ) {
      XFile? file = await picker.pickImage(source: ImageSource.camera);
      if (file!.path.isNotEmpty) {
        return file;
      }
      notifyListeners();
    }
    return null;
  }

  void openGalleryImages() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils()
            .requestPermission(Permission.accessMediaLocation)) {
      cameraImages = await picker.pickMultiImage();
    }
  }

  void openCameraVideos() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils()
            .requestPermission(Permission.accessMediaLocation)) {
      // cameraVideo = await picker.pickVideo(source: ImageSource.camera);
    }
  }

  void openGalleryVideos() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils()
            .requestPermission(Permission.accessMediaLocation)) {
      // cameraVideo = await picker.pickVideo(source: ImageSource.gallery);
    }
  }*/
}
