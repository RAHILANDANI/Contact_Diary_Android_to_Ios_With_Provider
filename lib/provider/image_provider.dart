import 'package:flutter/material.dart';

class ImageePrrovider extends ChangeNotifier {
  String imagePath = '';

  void addimage(String file) async {
    imagePath = file;
    notifyListeners();
  }
}
