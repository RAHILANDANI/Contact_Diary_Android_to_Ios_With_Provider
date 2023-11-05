import 'package:flutter/material.dart';

import '../model/abc.dart';

class AddContact extends ChangeNotifier {
  List<Contact> contactlist = <Contact>[];

  void addcontact(
      {required String name,
      required String contact,
      required String imgpath}) {
    contactlist.add(Contact(name: name, contact: contact, imgpath: imgpath));
    notifyListeners();
  }
}
