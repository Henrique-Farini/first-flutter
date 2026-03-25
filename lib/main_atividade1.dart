import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo Container") ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: 200,
              height: 100,
              color:  Colors.blue,
              child: Center(
              child: Text("Caixa 1", style: TextStyle(color: Color.fromARGB(230, 255, 255, 255,)),),
              ),),
              const SizedBox(height: 20,),

          
              

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),


               
              
              const SizedBox(width:  20,),

              Container(
                 width: 80,
                height: 80,
                color: Colors.green,
              ),
               ],
              )
            ],
          ),
          
        ),
      ),
    );
  }
}
