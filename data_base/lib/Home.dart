import 'package:data_base/Viwe.dart';
import 'package:data_base/value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  String name;
  String cont;
  Home(this. name,this .cont);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  Box box = Hive.box("demo");
  int a=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    t1.text=widget.name;
    t2.text=widget.cont;
    return Scaffold(
      appBar: AppBar(title: Text('$a'),),
      body: Center(child: Column(
        children: [
          TextField(controller: t1,),
          TextField(controller: t2,),
          ElevatedButton(onPressed: () {
            demo d=demo(t1.text,t2.text);
            box.add(d);
           widget.name='';
            widget.cont='';
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