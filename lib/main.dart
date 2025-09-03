
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
<<<<<<< HEAD

getPermission() async {
  var status = await Permission.contacts.status;
  if(status.isGranted){
    print('허락됨');
  }
  else if(status.isDenied){
    print('거절됨');
    Permission.contacts.request();
  }
}

@override

  var total = 0;
  var friends = [];
  var telNumber = [];
  var inputData = TextEditingController();//이름 입력값 저장
  var inputTelNum = TextEditingController();//전화번호 입력 저장


  void increaseA() { // 친구추가 함수
    if (inputData.text.isEmpty || inputTelNum.text.length != 8) {
=======
  var total = 0;
  var friends = [];
  var inputData = TextEditingController();//입력값 저장


  void increaseA() { // 친구추가 함수
    if (inputData.text.isEmpty) {
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
      print('입력된 내용이 없습니다.'); // 사용자에게 알려주거나 로그 출력
      return; // 여기서 함수를 조기 종료
    }
    setState(() {
<<<<<<< HEAD
      telNumber.add(inputTelNum.text);
=======
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
      friends.add(inputData.text);
      total++;
      Navigator.pop(context); // Dialog를 닫는 코드
    });

    // Dialog에서 추가 버튼을 누른 후 입력창을 비워준다.
    inputData.clear();
<<<<<<< HEAD
    inputTelNum.clear();
=======
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
  }

  void DelectFriends(int index){//친구삭제 함수
    setState(() {
      friends.removeAt(index);
      total--;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(onPressed: (){getPermission();}, icon: Icon(Icons.contacts))
        ],),
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
<<<<<<< HEAD
                      subtitle: Text(telNumber[i].toString()),
=======
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
                      trailing: IconButton(onPressed: (){DelectFriends(i);},
                          icon: Icon(Icons.cancel))
                  );
                }),
            ),
          ],
        ),
      bottomNavigationBar: Container(width: 300, height: 100,color: Colors.blue,
                           child: ElevatedButton(onPressed: (){setState(() {
                             friends.sort();
                           });}, child: Text('정렬'),),
                           ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           showDialog(context: context, builder: (context){
<<<<<<< HEAD
        return DialogUI(state : total, increaseA : increaseA, inputData : inputData,inputTelNum: inputTelNum,);
=======
        return DialogUI(state : total, increaseA: increaseA, inputData:inputData);
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
      });//자식 위젯에 전송하고
    }
    ),
    );
  }
}

class DialogUI extends StatelessWidget {
<<<<<<< HEAD
   DialogUI({super.key,this.state, required this.increaseA, this.inputData, this.inputTelNum});
    final state;
    final Function() increaseA;
    var inputData;
    var inputTelNum;
=======
   DialogUI({super.key,this.state, required this.increaseA, this.inputData});
    final state;
    final Function() increaseA;
    var inputData;

>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(controller: inputData),
<<<<<<< HEAD
            TextField(controller: inputTelNum,),
=======
>>>>>>> dad2bde3da0d95e5ce285b86a44ac0fd1159a731
            TextButton(onPressed: (){increaseA();}, child: Text('친구추가')),//버튼을 누르면 함수호출
            TextButton(onPressed: (){Navigator.pop(context);},//Dialog창 닫기 버튼
                       child: Text('취소')),
          ],
        ),
      ),
    );
  }
}
