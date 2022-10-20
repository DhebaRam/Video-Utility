import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_utility/utils/permission_utils.dart';

class GIFProvider extends ChangeNotifier{
  int previewImageIndex = 0;
  List images=[];

  List<XFile> cameraImages=[];
  XFile? cameraVideo;
  final ImagePicker picker = ImagePicker();

  Future<dynamic> openCameraImages() async {
    // XFile file;
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils().requestPermission(Permission
            .accessMediaLocation) /*&&
            await _requestPermission(Permission.manageExternalStorage)*/
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

  Future<dynamic> openCameraVideos() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils()
            .requestPermission(Permission.accessMediaLocation)) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowCompression: false,
      );
      // cameraVideo = await picker.pickVideo(source: ImageSource.camera);
      return result;
    }

  }

  void openGalleryVideos() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
        await PermissionUtils()
            .requestPermission(Permission.accessMediaLocation)) {
      cameraVideo = await picker.pickVideo(source: ImageSource.gallery);
    }
    return null;
  }

  void previewImageSet(index) {
    previewImageIndex = index;
    notifyListeners();
  }

  List<int>? generateGIF(List images) {
    return null;

    // final Animation animation = Animation();
    // for(Image image in images) {
    //   animation.addFrame(image);
    // }
    // return encodeGifAnimation(animation);
  }
}