import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  Future<bool> requestPermission(Permission permission) async {
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
  }
}
