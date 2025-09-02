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
  var total = 3;
  var friends = ['아', '홍길동','이정철'];
  var like = [0,0,0];
  var inputData = TextEditingController();//입력값 저장

  void increaseA(){//친구추가 함수
    setState(() {
      friends.add(inputData.text);//toString()으로 하니깐 이상한 글자로 뜨고 text로 하니깐 입력값 그대로 나옴
      total++;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SizedBox(child: Text(total.toString()),),
            Expanded(
              child: ListView.builder(
                itemCount: friends.length,
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
        return DialogUI(state : total, increaseA: increaseA, inputData:inputData);
      });//자식 위젯에 전송하고
    }
    ),
    );
  }
}

class DialogUI extends StatelessWidget {
   DialogUI({super.key,this.state, required this.increaseA, this.inputData});
    final state;
    final Function() increaseA;
    var inputData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(controller: inputData),
            TextButton(onPressed: (){increaseA();}, child: Text('친구추가')),
            TextButton(onPressed: (){Navigator.pop(context);},
                       child: Text('취소')),
          ],
        ),
      ),
    );
  }
}


