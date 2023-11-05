import 'package:flutter/material.dart';

import 'abc.dart';

class osprovider extends ChangeNotifier {
  oss osss = oss(isioss: false);

  void switchh() {
    osss.isioss = !osss.isioss;
    notifyListeners();
  }
}
