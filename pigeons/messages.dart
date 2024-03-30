// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.12

import 'package:pigeon/pigeon_lib.dart';

class TextureMessage {
  late int textureId;
}

class LoopingMessage {
  late int textureId;
  late bool isLooping;
}

class VolumeMessage {
  late int textureId;
  late double volume;
}

class PlaybackSpeedMessage {
  late int textureId;
  late double speed;
}

class PositionMessage {
  late int textureId;
  late int position;
}

class CreateMessage {
  late String asset;
  late String uri;
  late String packageName;
  late String formatHint;
  late Map<String, String> httpHeaders;
}

class MixWithOthersMessage {
  late bool mixWithOthers;
}

@HostApi(dartHostTestHandler: 'TestHostVideoPlayerApi')
abstract class VideoPlayerApi {
  void initialize();
  TextureMessage create(CreateMessage msg);
  void dispose(TextureMessage msg);
  void setLooping(LoopingMessage msg);
  void setVolume(VolumeMessage msg);
  void setPlaybackSpeed(PlaybackSpeedMessage msg);
  void play(TextureMessage msg);
  PositionMessage position(TextureMessage msg);
  void seekTo(PositionMessage msg);
  void pause(TextureMessage msg);
  void setMixWithOthers(MixWithOthersMessage msg);
}
