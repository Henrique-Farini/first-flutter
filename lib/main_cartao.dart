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
        appBar: AppBar(title: const Text("Meu Cartão"), centerTitle: true, // centralizado
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 236, 127, 43),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.topLeft, 
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/mastercard_itau_cartao.png',
                      width: 60,
                      height: 60,

                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "2468 1012 1416 1820",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(

                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: const [
                    SizedBox(width: 5), 
                    Text(
                      "validade",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "código de segurança (cvv)",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),

              Row(children: [
                const SizedBox(width: 5,),
                const Text("01/32", style: TextStyle(fontSize: 14, color: Colors.white),),
                const SizedBox(width: 45),
                const Text("123", style: TextStyle(fontSize: 14, color: Colors.white),),

              ],),
              const SizedBox(height: 30),

              Row(children: [
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
                    borderRadius: BorderRadius.circular(5),
                     color: const Color.fromARGB(255, 236, 127, 43),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "bloquear cartão ",
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 15),
                  Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
                    borderRadius: BorderRadius.circular(5),
                     color: const Color.fromARGB(255, 236, 127, 43),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "excluir cartão ",
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                  ),
                ),
              ],)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
