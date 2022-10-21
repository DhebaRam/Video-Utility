import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:video_utility/GIF/screen/preview_camera_gif_images.dart';
import 'package:video_utility/utils/app_colors.dart';
import 'package:video_utility/utils/console_log_utils.dart';
import 'package:video_utility/utils/dimens.dart';

import '../GIF/provider/gif_provider.dart';
import '../GIF/screen/video_to_gif.dart';
import 'app_images.dart';
import 'get_it.dart';

final gifProvider = getIt<GIFProvider>();

class ShowBottomSheets {
  showBottomSheets(BuildContext context, String galleryType) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: screenSize!.height / 4,
            width: screenSize!.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenSize!.width,
                  color: AppColor.colorPrimary,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  // height: smallHeigth,
                  child: Text("Choose one..", style: smallTitleTextStyle),
                ),
                Expanded(
                  child: Container(
                    // margin: const EdgeInsets.only(left: 20, right: 20),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    color: AppColor.colorPrimaryDark2,

                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // CreateDir().createDirectory();
                              if (galleryType == "Video") {
                                gifProvider.openCameraVideos().then((value) async{
                                  print("v.. ${value.runtimeType}");
                                  if(value.runtimeType == XFile){
                                    File file = File(value.path);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VideoToGIF(file: file)));
                                  }else{
                                    ConsoleLogUtils.printLog("Video Not Get Camera... ");
                                  }
                                });
                              } else if (galleryType == "Image") {
                                // Navigator.of(context).pop();
                                gifProvider
                                    .openCameraImages()
                                    .then((value) async {
                                  if (value.runtimeType == XFile) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PreviewCameraImages(value)));
                                  } else {
                                    print("objec111t");
                                  }
                                  // Navigator.of(context).pop();
                                  // XFile? cameraImage=value;
                                });
                              }
                            },
                            child: Container(
                              height: containerHeigth,
                              decoration: bottomSheetDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.camera_alt_rounded,
                                      color: AppColor.colorPrimary,
                                      size: imageMTinySmall),
                                  // Image.asset(
                                  //   AppImages.videoGIF,
                                  //   color: AppColor.colorPrimary,
                                  //   height: imageMTinyLarge,
                                  // ),
                                  const SizedBox(
                                    height: spacingXSmall,
                                  ),
                                  Text("Open Camera", style: regularTextStyle),
                                  const SizedBox(
                                    height: spacingTiny,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: smallWidth,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (galleryType == "Video") {
                                gifProvider.openGalleryVideos().then((value) async{
                                  print("v.. ${value.runtimeType}");
                                  if(value.runtimeType == FilePickerResult){
                                    File file = File(value.files.single.path!);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> VideoToGIF(file: file)));
                                  }else{
                                    ConsoleLogUtils.printLog("Video Not Get Camera... ");
                                  }
                                });
                              } else if (galleryType == "Image") {
                                gifProvider.openGalleryImages();
                                Navigator.of(context).pop();
                              }
                              // homeProvider.openCameraImages();
                            },
                            child: Container(
                              height: containerHeigth,
                              // width: screenSize!.width / 2.5,
                              decoration: bottomSheetDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.galleryImage,
                                      color: AppColor.colorPrimary,
                                      height: imageMTinySmall),
                                  const SizedBox(
                                    height: spacingXSmall,
                                  ),
                                  Text("Open Gallery", style: regularTextStyle),
                                  const SizedBox(
                                    height: spacingTiny,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
