import 'package:flutter/material.dart';
import 'package:video_utility/home/provider/home_provider.dart';
import 'package:video_utility/utils/app_colors.dart';
import 'package:video_utility/utils/dimens.dart';

import 'app_images.dart';
import 'get_it.dart';
final homeProvider = getIt<HomeProvider>();
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
                              if(galleryType == "Video"){
                                homeProvider.openCameraVideo();
                              }else if(galleryType == "Image"){
                                homeProvider.openCameraImages();
                                Navigator.of(context).pop();
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
