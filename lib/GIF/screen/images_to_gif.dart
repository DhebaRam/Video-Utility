import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as imageGen ;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_utility/GIF/provider/gif_provider.dart';
import 'package:video_utility/GIF/screen/preview_camera_gif_images.dart';
import 'package:video_utility/utils/app_colors.dart';
import '../../utils/dimens.dart';
import '../../utils/get_it.dart';

final gifProvider = getIt<GIFProvider>();
class ImagesToGIF extends StatelessWidget {
  const ImagesToGIF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images to GIF"),
        backgroundColor: AppColor.colorPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<GIFProvider>(builder: (_, showImageData, __) {
            return Image.file(
                File(showImageData
                    .cameraImages[showImageData.previewImageIndex].path),
                height: screenSize!.height / 1.28,
                fit: BoxFit.fill,
                width: double.infinity);
          }),
          Consumer<GIFProvider>(
            builder: (_, showImageData, __) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: SizedBox(
                  height: containerHeigth,
                  child: ListView.builder(
                      itemCount: showImageData.cameraImages.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => showImageData.previewImageSet(index),
                            child: Container(
                                width: containerWidth,
                                height: containerHeigth,
                                padding: const EdgeInsets.all(5),
                                // padding: const EdgeInsets.only(right: 10),
                                child: Image.file(
                                  File(showImageData.cameraImages[index].path),
                                  fit: BoxFit.fill,
                                )));
                      }),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          List<int>? gifData = gifProvider.generateGIF(gifProvider.images);
        },
        backgroundColor: AppColor.colorPrimary,
        child: const Icon(Icons.check, size: 40,),
      ),
    );
  }
}
