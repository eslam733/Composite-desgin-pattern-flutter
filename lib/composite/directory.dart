import 'package:composite_patterns/composite/file.dart';
import 'package:composite_patterns/composite/ifile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;
  final List<IFile> files = [];
  Directory({Key? key, required this.title, required this.isInitiallyExpanded})
      : super(key: key);

  @override
  int getSize() {
    int sum = 0;
    for (var file in files) {
      sum += file.getSize();
    }
    return sum;
  }

  void addFile(IFile file) {
    files.add(file);
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15),
        child: ExpansionTile(
          leading: const Icon(Icons.folder),
          title: Text(
            '$title ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Text(
            FileSizeConverter.bytesToString(getSize()),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          initiallyExpanded: isInitiallyExpanded,
          children: files.map((IFile file) {
            return file.render(context);
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
