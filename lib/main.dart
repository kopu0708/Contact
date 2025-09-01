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
  int a = 0;
  var friends = ['이정철','홍길동','아무개'];
  var like = [0,0,0];

  void increaseA(){
    setState(() {
      a++;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(child: Text(a.toString()),),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (c,i){
                  return
                    ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(friends[i].toString()),
                  );
                }),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           showDialog(context: context, builder: (context){
        return DialogUI(state : a, increaseA: increaseA);
      });
    }
    ),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({super.key,this.state, required this.increaseA});
    final state;
    final Function() increaseA;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton(onPressed: (){increaseA();}, child: Text('a를 늘려주기')),
            TextButton(onPressed: (){Navigator.pop(context);},
                       child: Text('취소')),
            Text(state.toString())
          ],
        ),
      ),
    );
  }
}


