import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ifile.dart';

class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;
  File({required this.title, required this.size, required this.icon});

  @override
  int getSize() {
    return size;
  }

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: Icon(icon),
        trailing: Text(
          FileSizeConverter.bytesToString(size),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}

class FileSizeConverter {
  static String bytesToString(int bytes) {
    var sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var len = bytes.toDouble();
    var order = 0;
    while (len >= 1024 && order++ < sizes.length - 1) {
      len /= 1024;
    }

    return '${len.toStringAsFixed(2)} ${sizes[order]}';
  }
}
