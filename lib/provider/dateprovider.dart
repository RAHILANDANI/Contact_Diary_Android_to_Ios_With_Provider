import 'package:flutter/material.dart';
import 'package:ios/model/date.dart';

class dateprovider extends ChangeNotifier {
  TimeOfDay cupertinofetchtime = TimeOfDay.now();
  String selDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  String setTime =
      "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
  String cupertinotime = '';
  Duration fetchduration = Duration(
    hours: (TimeOfDay.now().hour > 12)
        ? TimeOfDay.now().hour - 12
        : TimeOfDay.now().hour,
    minutes: TimeOfDay.now().minute,
  );
  dateandtime datetime = dateandtime(
    fetchtime: TimeOfDay.now(),
    fetchdate: DateTime.now(),
  );

  void changeDate(String pickedDate) {
    selDate = pickedDate;
    notifyListeners();
  }

  void changetime(String pickedTime) {
    setTime = pickedTime;
    notifyListeners();
  }

  void cupertinodate(String pickeddate) {
    selDate = pickeddate;
    notifyListeners();
  }

  void setcupertinotime(Duration res) {
    fetchduration = res;
    cupertinotime = "${res.inHours} : ${res.inMinutes % 60}";
    notifyListeners();
  }
}
