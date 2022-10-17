import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_utility/utils/console_log_utils.dart';
import 'package:video_utility/utils/permission_utils.dart';

class CreateDir {
  Directory? directory;

  /*Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      PermissionStatus result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
    }
    return false;
  }*/

  createDirectory() async {
    try {
      if (Platform.isAndroid) {
        if (await PermissionUtils().requestPermission(Permission.storage) &&
                await PermissionUtils().requestPermission(Permission
                    .accessMediaLocation) /*&&
            await _requestPermission(Permission.manageExternalStorage)*/
            ) {
          directory = await getExternalStorageDirectory();

          String newPath = "";
          String newSubPath = "";
          List<String> paths = directory!.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              newPath = "$newPath/Video Converter";
              directory = Directory(newPath);
              if (!await directory!.exists()) {
                await directory!.create(recursive: true);
              }
              break;
            }
          }
          List<String> subPaths = directory!.path.split("/");

          for (int x = 1; x < subPaths.length; x++) {
            String folder = subPaths[x];
            if (folder != "Video Converter") {
              newSubPath += "/$folder";
            } else {
              newSubPath += "/$folder";
              List<String> folderName = ["Audio", "GIF", "Image", "Video"];
              for (int i = 0; i < folderName.length; i++) {
                String newFolder = "$newSubPath/${folderName[i]}";
                directory = Directory(newFolder);
                if (!await directory!.exists()) {
                  await directory!.create(recursive: true);
                }
              }
              break;
            }
          }
        }
      } else if (Platform.isIOS) {
        if (await PermissionUtils().requestPermission(Permission.storage)) {
          directory = await getApplicationDocumentsDirectory();
          if (!await directory!.exists()) {
            await directory!.create(recursive: true);
          }
          if (await directory!.exists()) {
            File saveFile = File('${directory!.path}/abc.pdf');
            // await saveFile.writeAsBytes();
            return true;
          }
          return false;
          // final file = File('${directory.path}/$fileName');

          // await file.writeAsBytes(linked);

          // directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      ConsoleLogUtils.printLog(e.toString());
    }
  }
}
