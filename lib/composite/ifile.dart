import 'package:flutter/cupertino.dart';

abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
}
