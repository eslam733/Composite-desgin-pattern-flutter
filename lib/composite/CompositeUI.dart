import 'package:composite_patterns/composite/directory.dart';
import 'package:composite_patterns/composite/file_types.dart';
import 'package:flutter/material.dart';

class CompositeExample extends StatelessWidget {
  const CompositeExample({Key? key}) : super(key: key);

  Widget _buildMediaDirectory() {
    final musicDirectory = Directory(
      title: 'Music',
      isInitiallyExpanded: false,
    );
    musicDirectory.addFile(
      AudioFile('Darude - Sandstorm.mp3', 2612453),
    );
    musicDirectory.addFile(
      AudioFile('Toto - Africa.mp3', 3219811),
    );
    musicDirectory.addFile(
      AudioFile('Bag Raiders - Shooting Stars.mp3', 3811214),
    );

    final moviesDirectory = Directory(
      title: 'Movies',
      isInitiallyExpanded: false,
    );

    moviesDirectory.addFile(
      VideoFile('The Matrix.avi', 951495532),
    );
    moviesDirectory.addFile(
      VideoFile('The Matrix Reloaded.mp4', 1251495532),
    );

    final catPicturesDirectory = Directory(
      title: 'Cats',
      isInitiallyExpanded: false,
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 1.jpg', 844497),
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 2.jpg', 975363),
    );
    catPicturesDirectory.addFile(
      ImageFile('Cat 3.png', 1975363),
    );

    final picturesDirectory = Directory(
      title: 'Pictures',
      isInitiallyExpanded: false,
    );
    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(
      ImageFile('Not a cat.png', 2971361),
    );

    final mediaDirectory = Directory(title: 'Media', isInitiallyExpanded: true);
    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(moviesDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory
        .addFile(Directory(title: 'New Folder', isInitiallyExpanded: false));
    mediaDirectory.addFile(
      TextFile('Nothing suspicious there.txt', 430791),
    );
    mediaDirectory.addFile(
      TextFile('TeamTrees.txt', 104),
    );

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: _buildMediaDirectory(),
      ),
    );
  }
}
