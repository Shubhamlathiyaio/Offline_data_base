import 'package:data_base/Home.dart';
import 'package:data_base/value.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class viwe extends StatefulWidget {
  const viwe({super.key});

  @override
  State<viwe> createState() => _viweState();
}

class _viweState extends State<viwe> {
  Box box=Hive.box('demo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          demo d=box.getAt(index);
          return Card(
              child: ListTile(trailing: Wrap(children: [
                IconButton(onPressed: () => setState(() {
                  box.deleteAt(index);
                }), icon: Icon(Icons.delete)),
                IconButton(onPressed: () => setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Home(d.name.toString(), d.cont.toString()),));
                }), icon: Icon(Icons.edit)),
              ]),
                title: Text('${d.name}'),
                subtitle: Text('${d.cont}'),

              ));
        }
      ),
    );
  }
}
