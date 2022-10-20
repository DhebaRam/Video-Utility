import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimens.dart';

class VideoToGIF extends StatefulWidget {
  final File file;

  const VideoToGIF({Key? key, required this.file}) : super(key: key);

  @override
  State<VideoToGIF> createState() => _VideoToGIFState();
}

class _VideoToGIFState extends State<VideoToGIF> {
  final Trimmer _trimmer = Trimmer();
  double _startValue = 0.0;
  double _endValue = 0.0;
  bool _isPlaying = false;
  bool zoom = false;

  // trimmerVideo() async{
  //   await _trimmer.videPlaybackControl(
  //     startValue: 0,
  //     endValue: 10,
  //   );
  // }
  void _loadVideo() {
    _trimmer.loadVideo(videoFile: widget.file);
    setState(() {
      print("Duration ${_trimmer.videoPlayerController!.value.isPlaying}");
    });
  }

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimaryDark2,
      appBar: AppBar(
        title: const Text("Video to GIF"),
        backgroundColor: AppColor.colorPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Expanded(
            flex: zoom ? 6 : 8,
            child: Container(
                color: AppColor.white, child: VideoViewer(trimmer: _trimmer)),
          ),
          zoom
              ? const Text("")
              : Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    // height: 50,
                    color: AppColor.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: _isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  size: 40.0,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 40.0,
                                  color: Colors.black,
                                ),
                          onPressed: () async {
                            bool playbackState =
                                await _trimmer.videPlaybackControl(
                              startValue: _startValue,
                              endValue: _endValue,
                            );
                            setState(() {
                              print("Duration ${_trimmer.videoPlayerController!.value.duration.inSeconds}");
                              _isPlaying = playbackState;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${_trimmer.videoPlayerController!.value.position.inSeconds}"),
                        ),
                        Expanded(
                          child: TrimEditor(
                            circleSize: 5.0,
                            borderWidth: 3,
                            scrubberWidth: 10,
                            circleSizeOnDrag: 8.0,
                            circlePaintColor: Colors.white,
                            borderPaintColor: Colors.white,
                            scrubberPaintColor: Colors.white,
                            thumbnailQuality: 75,
                            showDuration: false,
                            sideTapSize: 24,
                            durationTextStyle:
                                const TextStyle(color: Colors.white),
                            trimmer: _trimmer,
                            // viewerHeight: 60.0,
                            // viewerWidth: MediaQuery.of(context).size.width / 1.5,
                            // maxVideoLength: Duration(seconds: _endValue.toInt()),
                            onChangeStart: (value) {
                              setState(() {
                              _startValue = value / 1000;
                              });
                            },
                            onChangeEnd: (value) {
                              setState(() {
                              _endValue = value / 1000;
                              });
                            },
                            onChangePlaybackState: (value) {
                              setState(() {
                                print("Duration ${_trimmer.videoPlayerController!.value.position.inSeconds}");
                                print("onChangePlaybackState $value");
                              _isPlaying = value;
                              });
                            },
                          ),
                        ),
                        Text("${_trimmer.videoPlayerController!.value.duration.inSeconds}")
                      ],
                    ),
                  ),
                ),
          const Expanded(
            flex: 1,
            child: Text(""),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory? directory = await getExternalStorageDirectory();

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
              if (!await directory.exists()) {
                await directory!.create(recursive: true);
              }
              break;
            }
          }
        },
        backgroundColor: AppColor.colorPrimary,
        child: const Icon(
          Icons.check,
          size: 40,
        ),
      ),
    );
  }
}
