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
        appBar: AppBar(title: const Text("Meu Perfil"), centerTitle: true, // centralizado
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 1000,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 172, 43, 236),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topLeft, 
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/macacopensador.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );

  

  }

  
}


