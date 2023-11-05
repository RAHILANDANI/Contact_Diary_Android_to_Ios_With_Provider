import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios/provider/addprovider.dart';
import 'package:provider/provider.dart';

import '../model/os.dart';
import '../provider/dateprovider.dart';

class MyiosApp extends StatefulWidget {
  const MyiosApp({super.key});

  @override
  State<MyiosApp> createState() => _MyiosAppState();
}

class _MyiosAppState extends State<MyiosApp> {
  TextStyle textStyle = TextStyle(
      fontSize: 30, color: Colors.grey.shade800, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    DateTime responce;
    var datetimefalse = Provider.of<dateprovider>(context, listen: false);
    var date = Provider.of<dateprovider>(context);
    List<Widget> page = [
      Provider.of<AddContact>(context).contactlist.isEmpty
          ? Container()
          : SafeArea(
              child: CupertinoListSection(
                children: Provider.of<AddContact>(context)
                    .contactlist
                    .map(
                      (e) => CupertinoListTile(
                        leading: CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File(e.imgpath)),
                        ),
                        title: Text(e.name),
                        subtitle: Text(e.contact),
                      ),
                    )
                    .toList(),
              ),
            ),
      Provider.of<AddContact>(context).contactlist.isEmpty
          ? Container()
          : SafeArea(
              child: CupertinoListSection(
                children: Provider.of<AddContact>(context)
                    .contactlist
                    .map(
                      (e) => CupertinoListTile(
                        leading: CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File(e.imgpath.isEmpty
                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0seYWZ3IHssMYRoTweai2zFgYfg4pe8ESg&usqp=CAU"
                              : e.imgpath)),
                        ),
                        title: Text(e.name.isEmpty ? "Rahil Andani" : e.name),
                        subtitle:
                            Text(e.contact.isEmpty ? "9228820333" : e.contact),
                        trailing: Icon(CupertinoIcons.phone_arrow_up_right),
                      ),
                    )
                    .toList(),
              ),
            ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: textStyle,
                ),
                Text(
                  Provider.of<dateprovider>(context, listen: false).selDate,
                  style: textStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
              child: Text("Change Date"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        minimumDate: DateTime(2000),
                        maximumDate: DateTime(2024),
                        initialDateTime: Provider.of<dateprovider>(context)
                            .datetime
                            .fetchdate,
                        onDateTimeChanged: (DateTime value) {
                          responce = value;
                          print(responce);
                          Provider.of<dateprovider>(context, listen: false)
                              .cupertinodate(
                                  "${responce.day}/${responce.month}/${responce.year}");
                        },
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  style: textStyle,
                ),
                Text(
                  "${date.datetime.fetchtime.hour} : ${date.datetime.fetchtime.minute} : ${date.datetime.fetchtime.period.name}",
                  style: textStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: CupertinoButton(
                color: Colors.grey.shade800,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      height: 300,
                      color: CupertinoColors.white,
                      child: CupertinoTimerPicker(
                          mode: CupertinoTimerPickerMode.hm,
                          initialTimerDuration: date.fetchduration,
                          onTimerDurationChanged: (Duration val) {
                            date.fetchduration;
                          }),
                    ),
                  );
                },
                child: Text(
                  "Change Time",
                ),
              ),
            )
          ],
        ),
      ),
    ];
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.grey.shade800,
        middle: Text(
          "Contact",
          style: TextStyle(color: Colors.white),
        ),
        trailing: CupertinoSwitch(
          value: Provider.of<osprovider>(context).osss.isioss,
          onChanged: (value) {
            Provider.of<osprovider>(context, listen: false).switchh();
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.grey.shade800,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_2,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
            ),
          ],
        ),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) => Column(
            children: [page[index]],
          ),
        ),
      ),
    );
  }
}
