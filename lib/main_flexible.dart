import 'package:flutter/material.dart';

void main() {
  runApp(FlexibleExample());
}

class FlexibleExample extends StatelessWidget {
  const FlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplo Flexible",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flexible"),
        ),
        body: Row(
          children: [
              Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                  color: const Color.fromARGB(255, 160, 76, 175),
                  child: const Center(child: Text("1 parte", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  ),
                ),
                 Flexible(
                        flex: 2,
                        child: Container(
                          height: 120,
                  color: const Color.fromARGB(255, 76, 81, 175),
                  child: const Center(child: Text("2 parte", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  ),
                ),
                Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                  color: const Color.fromARGB(255, 175, 76, 155),
                  child: const Center(child: Text("3 parte", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  ),
                ),
            ]
          ),
        ),
    );
  }
}
