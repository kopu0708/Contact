import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home: MyApp()
      )
  );
}


class MyApp extends StatefulWidget{
 MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (context){
              return Dialog(child: Text('안녕'));
            });
          },
        ),
            appBar: AppBar(),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c,i){
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('user'),
            );
          })

    );
  }
}


