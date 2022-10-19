import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as jpg;
import 'package:image/image.dart' as encodeImage;
import 'package:image/image.dart' as anim;
import 'package:image_picker/image_picker.dart';
import 'package:video_utility/GIF/animation_gif.dart';
import 'package:video_utility/home/provider/home_provider.dart';
import 'package:video_utility/utils/app_colors.dart';
import 'package:video_utility/utils/dimens.dart';
import '../../utils/console_log_utils.dart';
import '../../utils/get_it.dart';
import '../provider/gif_provider.dart';
import 'images_to_gif.dart';
// import 'package:flutter/animation.dart' as animate;

final gifProvider = getIt<GIFProvider>();
final homeProvider = getIt<HomeProvider>();

class PreviewCameraImages extends StatelessWidget {
  XFile? image;

  PreviewCameraImages(this.image, {super.key});

  // PreviewCameraImages(image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: AppColor.colorPrimary,
      ),
      body: Column(
        children: [
          image == null
              ? const Text("No image captured")
              : Image.file(File(image!.path),
                  height: screenSize!.height / 1.18,
                  fit: BoxFit.fill,
                  width: double.infinity),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            height: imageMTinySmall,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      final List images = [];
                      Uint8List? data;
                      final jpg.JpegDecoder decoder = jpg.JpegDecoder();
                      gifProvider.cameraImages.add(image!);
                      for (var imgFile in gifProvider.cameraImages) {
                         data =  await imgFile.readAsBytes();
                        //homeProvider.decodeImages(data);
                        images.add(decoder.decodeImage(data));


                      }
                      // List<int>? gifData = generateGIF(images);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => const ImagesToGIF()));
                    },
                    child: Text("Done", style: regularTextStyle)),
                TextButton(
                    onPressed: () {
                      gifProvider.openCameraImages().then((value) {
                        if (value.runtimeType == XFile) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PreviewCameraImages(value)));
                        } else {}
                      });
                    },
                    child: Text("Retake", style: regularTextStyle)),
                TextButton(
                    onPressed: () {
                      gifProvider.cameraImages.add(image!);
                      ConsoleLogUtils.printLog("Images.... ${image!.name}");
                      gifProvider.openCameraImages().then((value) {
                        if (value.runtimeType == XFile) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PreviewCameraImages(value)));
                        } else {
                          print("objec111t");
                        }
                      });
                    },
                    child: Text("Next", style: regularTextStyle))
              ],
            ),
          )
        ],
      ),
    );
  }

  // List<int>? generateGIF(Iterable<Image> images) {
  //   // Animation<dynamic> a=Animate;
  //   List<Animation<dynamic>> scaleAnimations;
  //
  //   anim.Animation animate = anim.Animation();
  //   for(Image image in images) {
  //    // animate.addFrame(image.image);
  //     // animation.addFrame(image);
  //   }
  //   return encodeImage.encodeGifAnimation(animation);
  // }
}


// class Animate extends  {
//   /// The canvas width for containing the animation.
//   int width = 0;
//
//   /// The canvas height for containing the animation.
//   int height = 0;
//
//   /// The suggested background color to clear the canvas with.
//   int backgroundColor = 0xffffffff;
//
//   /// The frames of the animation.
//   List<Image> frames = [];
//
//   /// How many times should the animation loop (0 means forever)?
//   int loopCount = 0;
//
//   /// How should the frames be interpreted?  If [FrameType.animation], the
//   /// frames are part of an animated sequence. If [FrameType.page], the frames
//   /// are the pages of a document.
//   jpg.FrameType frameType = jpg.FrameType.animation;
//
//   /// How many frames are in the animation?
//   int get numFrames => frames.length;
//
//   /// How many frames are in the animation?
//   @override
//   int get length => frames.length;
//
//   /// Get the frame at the given [index].
//   Image operator [](int index) => frames[index];
//
//   /// Add a frame to the animation.
//   void addFrame(Image image) {
//     frames.add(image);
//   }
//
//   /// The first frame of the animation.
//   @override
//   Image get first => frames.first;
//
//   /// The last frame of the animation.
//   @override
//   Image get last => frames.last;
//
//   /// Is the animation empty (no frames)?
//   @override
//   bool get isEmpty => frames.isEmpty;
//
//   /// Returns true if there is at least one frame in the animation.
//   @override
//   bool get isNotEmpty => frames.isNotEmpty;
//
//   /// Get the iterator for looping over the animation. This allows the
//   /// Animation to be used in for-each loops:
//   /// for (AnimationFrame frame in animation) { ... }
//   @override
//   Iterator<Image> get iterator => frames.iterator;
// }
