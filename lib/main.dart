import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget{
 MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var Users = <String>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Text(a.toString()),
              onPressed: (){
                setState(() {
                  Users.add('user');
                });
              }
          ),
          appBar: AppBar( title: Text('연락처 앱'),
            backgroundColor: Color(0xFF4287F8),
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
               itemCount: 100,
               itemBuilder: (context, i){
                 print(i);
                 return ListTile(
                   leading: Icon(Icons.account_circle),
                   title: Text(Users[i]),
                 );
               },
            ),
          ),
         bottomNavigationBar: BottomAppBar(
          child:custom(),
        ),
        ),
    );
  }
}


class custom extends StatelessWidget {
  const custom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.phone)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.contact_page)),
      ],
    );
  }
}

