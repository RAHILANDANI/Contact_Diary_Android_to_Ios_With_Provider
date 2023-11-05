// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ios/provider/dateprovider.dart';
import 'package:ios/provider/image_provider.dart';
import 'package:ios/provider/stepperprovider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/os.dart';
import '../provider/addprovider.dart';

class MyAndroid extends StatefulWidget {
  const MyAndroid({super.key});

  @override
  State<MyAndroid> createState() => _MyAndroidState();
}

class _MyAndroidState extends State<MyAndroid> {
  int count = 0;
  int selectedindex = 0;
  String name = '';
  String contact = '';
  ImagePicker imagePicker = ImagePicker();

  TextStyle textStyle = TextStyle(
      fontSize: 20, color: Colors.grey.shade800, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    var res = Provider.of<osprovider>(context);
    var res3 = Provider.of<AddContact>(context);
    var stepper = Provider.of<StepperProvider>(context);
    var date = Provider.of<dateprovider>(context);
    var res2 = Provider.of<osprovider>(context, listen: false);
    var res4 = Provider.of<AddContact>(context, listen: false);
    var stepperfalse = Provider.of<StepperProvider>(context, listen: false);
    var datetimefalse = Provider.of<dateprovider>(context, listen: false);
    var image = Provider.of<ImageePrrovider>(context);
    var imagefalse = Provider.of<ImageePrrovider>(context, listen: false);

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(
                            Provider.of<ImageePrrovider>(context).imagePath)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Rahil Andani",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                selected: selectedindex == 0,
                onTap: () {},
                title: Text("Home"),
              ),
              ListTile(
                selected: selectedindex == 1,
                onTap: () {},
                title: Text("Profile"),
              ),
              ListTile(
                selected: selectedindex == 2,
                onTap: () {},
                title: Text("Edit"),
              ),
              ListTile(
                selected: selectedindex == 3,
                onTap: () {},
                title: Text("Setting"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text(
            "Clone WhatsApp",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Switch.adaptive(
              activeColor: Colors.grey.shade800,
              value: Provider.of<osprovider>(context).osss.isioss,
              onChanged: (value) {
                Provider.of<osprovider>(context, listen: false).switchh();
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Chats"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Calls"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Setting"),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: ListView(
                  children: res3.contactlist
                      .map((e) => InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 358,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CircleAvatar(
                                          radius: 50,
                                          backgroundImage:
                                              FileImage(File(e.imgpath)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${e.name}",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("+91 ${e.contact}",
                                            style: TextStyle(fontSize: 20)),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20,
                                              bottom: 8),
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Center(
                                              child: Text(
                                                "Send Message",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.black),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                    File(e.imgpath),
                                  ),
                                ),
                                title: Text(e.name),
                                subtitle: Text(e.contact),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.grey.shade800,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Stepper in AlertDialog'),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: 300,
                              child: Stepper(
                                currentStep:
                                    Provider.of<StepperProvider>(context)
                                        .currentStep,
                                onStepContinue: () {
                                  Provider.of<StepperProvider>(context,
                                          listen: false)
                                      .onStepContinue();
                                },
                                onStepCancel: () {
                                  Provider.of<StepperProvider>(context,
                                          listen: false)
                                      .onStepCancel();
                                },
                                steps: [
                                  Step(
                                    title: Text('Profile Photo'),
                                    content: InkWell(
                                      onTap: () async {
                                        XFile? file =
                                            await imagePicker.pickImage(
                                                source: ImageSource.camera);
                                        imagefalse.addimage(file!.path.isEmpty
                                            ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0seYWZ3IHssMYRoTweai2zFgYfg4pe8ESg&usqp=CAU"
                                            : file.path);
                                      },
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: FileImage(
                                          File(Provider.of<ImageePrrovider>(
                                                      context)
                                                  .imagePath
                                                  .isEmpty
                                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0seYWZ3IHssMYRoTweai2zFgYfg4pe8ESg&usqp=CAU"
                                              : Provider.of<ImageePrrovider>(
                                                      context)
                                                  .imagePath),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              right: 4,
                                              bottom: 2,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Step(
                                    title: Text('Enter Name'),
                                    content: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text("Rahil Andani"),
                                      ),
                                      onChanged: (val) {
                                        name = val;
                                      },
                                    ),
                                  ),
                                  Step(
                                    title: Text('Contact'),
                                    content: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text("9228820333"),
                                      ),
                                      onChanged: (val) {
                                        contact = val;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the AlertDialog
                              },
                              child: Text('Close'),
                            ),
                            TextButton(
                              onPressed: () {
                                res3.addcontact(
                                    name: name,
                                    contact: contact,
                                    imgpath: Provider.of<ImageePrrovider>(
                                            context,
                                            listen: false)
                                        .imagePath);
                                Navigator.pop(context);
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ListView(
              children: res3.contactlist
                  .map((e) => Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              File(e.imgpath.isEmpty
                                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0seYWZ3IHssMYRoTweai2zFgYfg4pe8ESg&usqp=CAU"
                                  : e.imgpath),
                            ),
                          ),
                          title: Text(e.name),
                          subtitle: Text(e.contact),
                          trailing: IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse("tel:${e.contact}"),
                              );
                            },
                            icon: Icon(
                              Icons.call,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                      ))
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
                      date.selDate,
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
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      DateTime? responce = await showDatePicker(
                        context: context,
                        initialDate: date.datetime.fetchdate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2024),
                      );
                      datetimefalse.changeDate(
                          "${responce!.day}/${responce.month}/${responce.year}");
                    },
                    child: Text(
                      "Change Date",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  color: Colors.grey.shade800,
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
                      date.setTime,
                      style: textStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    TimeOfDay? responcetime = await showTimePicker(
                        context: context, initialTime: date.datetime.fetchtime);
                    datetimefalse.changetime(
                        "${responcetime?.hour}:${responcetime?.minute}");
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Change Time",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
