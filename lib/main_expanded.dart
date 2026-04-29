import 'package:flutter/material.dart';

void main() {
  runApp(ExpandedExample());
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplo Expanded",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expanded"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text("Header", style: TextStyle(color: Colors.white, fontSize: 18),),),
              ),
              Expanded(child:   Container(
                color: const Color.fromARGB(255, 160, 76, 175),
                child: const Center(
                  child: Text("Ocupa todo o espaço", style: TextStyle(color: Colors.white, fontSize: 18),),),
              )),
            ]
          ),
        ),
      ),
    );
  }
}
