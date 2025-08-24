import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF4287F8),
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
                    children: [
                         Row(
                          children: [
                            Icon(Icons.account_circle,size:70),
                            SizedBox(width: 5,),
                            Text('홍길동',style: TextStyle(fontSize: 24.0),)
                          ],
                        ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.account_circle,size:70),
                          SizedBox(width: 5,),
                          Text('홍길동',style: TextStyle(fontSize: 24.0))
                        ],
                      )
                    ],
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

