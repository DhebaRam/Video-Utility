import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_utility/utils/permission_utils.dart';

class HomeProvider extends ChangeNotifier {
  List<XFile> ? pickedFile;
  // XFile ? file;
  List<XFile>? cameraImages;
  late PickedFile cameraVideo;
  final ImagePicker picker = ImagePicker();

  void openCameraImages() async {
    if (await PermissionUtils().requestPermission(Permission.storage) &&
            await PermissionUtils().requestPermission(Permission
                .accessMediaLocation) /*&&
            await _requestPermission(Permission.manageExternalStorage)*/
        ) {
      final file = await picker.pickImage(source: ImageSource.camera);
      if(file!.path.isNotEmpty){
        cameraImages!.add(file);
        // print("length .... ${cameraImages!.length}");
        print("length .... ${file}");
      }
      // cameraImages = (await picker.pickImage(source: ImageSource.camera);
      notifyListeners();
    }
  }

  void openCameraVideo() async {
    final status = await Permission.storage.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await Permission.storage.request();
    }

    if (status.isGranted) {
      cameraVideo =
          (await picker.pickVideo(source: ImageSource.camera))! as PickedFile;
      notifyListeners();
    } else if (status.isDenied) {
      debugPrint('Permission Denied');
      return;
    }
  }
}
