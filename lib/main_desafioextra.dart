import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContadorTela(),
    );
  }
}

class ContadorTela extends StatefulWidget {
  const ContadorTela({super.key});

  @override
  _ContadorTelaState createState() => _ContadorTelaState();
}

class _ContadorTelaState extends State<ContadorTela> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }
  void decrementar() {
    setState(() {
      if (contador >0) {contador--;}
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplicativo de Curtidas"),centerTitle: true),
       body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 80, color: Colors.redAccent,),
              SizedBox(height: 20,),
              Text(" $contador curtidas",
            style: const TextStyle(fontSize: 18,  fontWeight: FontWeight.bold),),

            SizedBox(height: 20),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                ElevatedButton(
                onPressed: incrementar,
               child: Text("👍 Curtir", style: TextStyle(fontSize: 18),),
               ),

               
              
              const SizedBox(width:  20,),

               ElevatedButton(
                onPressed: decrementar,
               child: Text("👎 Descurtir", style: TextStyle(fontSize: 18),),
               ),
              

            ],
            
            )
            ],
       ),
       
      ),
    );
  }
}
