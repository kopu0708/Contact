import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
 MyApp({Key? key}) : super(key: key);

   var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Text(a.toString()),
              onPressed: (){
                print (a);
                a++;
              }
          ),
          appBar: AppBar( title: Align(
            alignment: Alignment. bottomRight,
            child: Container(child:Text('dkdk'),width:50,height: 50,),
          ),
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
                   title: Text('user'),
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

