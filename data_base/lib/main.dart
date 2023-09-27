
import 'dart:io';

import 'package:data_base/value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Home.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(demoAdapter());
  Box box=await Hive.openBox('demo');
  runApp(MaterialApp(home: Home('',''),));
}

