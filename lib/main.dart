import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios/model/os.dart';
import 'package:ios/provider/addprovider.dart';
import 'package:ios/provider/dateprovider.dart';
import 'package:ios/provider/image_provider.dart';
import 'package:ios/provider/stepperprovider.dart';
import 'package:ios/views/android.dart';
import 'package:ios/views/ios.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => osprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AddContact(),
          ),
          ChangeNotifierProvider(
            create: (context) => dateprovider(),
          ),
          ChangeNotifierProvider(
            create: (context) => StepperProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ImageePrrovider(),
          ),
        ],
        builder: (context, _) =>
            Provider.of<osprovider>(context).osss.isioss == false
                ? MaterialApp(
                    home: MyAndroid(),
                  )
                : CupertinoApp(
                    home: MyiosApp(),
                  ));
  }
}
