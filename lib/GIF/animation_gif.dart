import 'dart:collection';

import 'package:flutter/material.dart';

enum FrameType {
  /// The frames of this document are to be interpreted as animation.
  animation,

  /// The frames of this document are to be interpreted as pages of a document.
  page
}

class AnimationClass extends IterableBase<Image> {
  /// The canvas width for containing the animation.
  int width = 0;

  /// The canvas height for containing the animation.
  int height = 0;

  /// The suggested background color to clear the canvas with.
  int backgroundColor = 0xffffffff;

  /// The frames of the animation.
  List<Image> frames = [];

  /// How many times should the animation loop (0 means forever)?
  int loopCount = 0;

  /// How should the frames be interpreted?  If [FrameType.animation], the
  /// frames are part of an animated sequence. If [FrameType.page], the frames
  /// are the pages of a document.
  FrameType frameType = FrameType.animation;

  /// How many frames are in the animation?
  int get numFrames => frames.length;

  /// How many frames are in the animation?
  @override
  int get length => frames.length;

  /// Get the frame at the given [index].
  Image operator [](int index) => frames[index];

  /// Add a frame to the animation.
  void addFrame(Image image) {
    frames.add(image);
  }

  /// The first frame of the animation.
  @override
  Image get first => frames.first;

  /// The last frame of the animation.
  @override
  Image get last => frames.last;

  /// Is the animation empty (no frames)?
  @override
  bool get isEmpty => frames.isEmpty;

  /// Returns true if there is at least one frame in the animation.
  @override
  bool get isNotEmpty => frames.isNotEmpty;

  /// Get the iterator for looping over the animation. This allows the
  /// Animation to be used in for-each loops:
  /// for (AnimationFrame frame in animation) { ... }
  @override
  Iterator<Image> get iterator => frames.iterator;
}

