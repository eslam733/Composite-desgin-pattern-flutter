import 'package:composite_patterns/composite/file.dart';
import 'package:flutter/material.dart';

class AudioFile extends File {
  AudioFile(String title, int size)
      : super(title: title, size: size, icon: Icons.music_note);
}

class ImageFile extends File {
  ImageFile(String title, int size)
      : super(title: title, size: size, icon: Icons.image);
}

class TextFile extends File {
  TextFile(String title, int size)
      : super(title: title, size: size, icon: Icons.description);
}

class VideoFile extends File {
  VideoFile(String title, int size)
      : super(title: title, size: size, icon: Icons.movie);
}
