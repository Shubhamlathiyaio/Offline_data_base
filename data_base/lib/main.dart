import 'dart:io';

import 'package:data_base/Viwe.dart';
import 'package:data_base/value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  Hive.registerAdapter(demoAdapter());
  var box=await Hive.openBox('demo');
  runApp(MaterialApp(home: Home(),));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController name=TextEditingController();
  TextEditingController cont=TextEditingController();
  Box box = Hive.box("demo");
  int a=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$a'),),
      body: Center(child: Column(
        children: [
          TextField(controller: name,),
          TextField(controller: cont,),
          ElevatedButton(onPressed: () {

            demo d=demo(name.text,cont.text);
            box.add(d);
            setState(() {});
          }, child: Text('Add')),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return viwe();
            },));
          }, child: Text('Viwe')),
        ],
      ),),
    );
  }
}
