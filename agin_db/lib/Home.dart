import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Hive'),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Container(color: Colors.purple,height: 200,width: 200,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 200,height: 100,child: TextField(controller: t1,)),
            Container(width: 200,height: 100,child: TextField(controller: t2,)),
          ],
        ),
          ElevatedButton(onPressed: () => setState(() {
            print('Added');
          }), child: Text('Add',style: TextStyle(fontSize: 24),)),
        ]),
      ),
    );
  }
}
