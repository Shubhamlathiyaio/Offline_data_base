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
        itemBuilder: (context, index) => Card(
            child: ListTile(
          title: Text('${box.name}'),
          subtitle: Text(''),
        )),
      ),
    );
  }
}
