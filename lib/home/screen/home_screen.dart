import 'package:flutter/material.dart';
import 'package:video_utility/utils/app_colors.dart';
import 'package:video_utility/utils/app_images.dart';
import 'package:video_utility/utils/dimens.dart';
import 'package:video_utility/utils/directory_create.dart';

import '../../utils/bottom_sheet_choose_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          color: AppColor.colorPrimary,
          width: screenSize!.width,
          height: screenSize!.height / 8,
          child: Center(
            child: Text(
              "Video Utility",
              textAlign: TextAlign.center,
              style: titleTextStyle,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              color: AppColor.colorPrimary,
              width: MediaQuery.of(context).size.width,
              height: screenSize!.height / 15,
              padding: const EdgeInsets.only(top: 60),
            ),
            SizedBox(
              height: screenSize!.height / 1.15,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: AppColor.colorPrimaryDark,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                CreateDir().createDirectory();
                                ShowBottomSheets().showBottomSheets(context,"Video");
                              },
                              child: Container(
                                height: containerHeigth,
                                decoration: boxDecoration,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AppImages.videoGIF,
                                      color: AppColor.colorPrimary,
                                      height: imageMTinyLarge,
                                    ),
                                    Text("Video To GIF",
                                        style: regularTextStyle)
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
                                CreateDir().createDirectory();
                                ShowBottomSheets().showBottomSheets(context,"Image");
                              },
                              child: Container(
                                height: containerHeigth,
                                width: screenSize!.width / 2.5,
                                decoration: boxDecoration,
                                child: Column(
                                  children: [
                                    Image.asset(AppImages.imageGIF,
                                        color: AppColor.colorPrimary,
                                        height: imageMTinyLarge),
                                    Text("Images To GIF",
                                        style: regularTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: smallHeigth,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: containerHeigth,
                              decoration: boxDecoration,
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppImages.videoGIF,
                                    color: AppColor.colorPrimary,
                                    height: imageMTinyLarge,
                                  ),
                                  Text("Video To GIF", style: regularTextStyle)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: smallWidth,
                          ),
                          Expanded(
                            child: Container(
                              height: containerHeigth,
                              width: screenSize!.width / 2.5,
                              decoration: boxDecoration,
                              child: Column(
                                children: [
                                  Image.asset(AppImages.imageGIF,
                                      color: AppColor.colorPrimary,
                                      height: imageMTinyLarge),
                                  Text("Images To GIF", style: regularTextStyle)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
