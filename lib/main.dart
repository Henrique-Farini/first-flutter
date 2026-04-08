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
        appBar: AppBar(
          title: const Text("Meus Cartões"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: ListView( // ListView permite rolar se houver muitos cartões
          padding: const EdgeInsets.all(16),
          children: [
            const CreditCardWidget(),
            const SizedBox(height: 20),
            const CreditCardWidget(),
          ],
        ),
      ),
    );
  }
}

// Transformei o cartão em um componente reutilizável
class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 236, 127, 43),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Use Icon se a imagem ainda não estiver configurada no pubspec.yaml
              const Icon(Icons.credit_card, size: 40, color: Colors.white),
              const SizedBox(width: 10),
              const Text(
                "2468 1012 1416 1820",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              SizedBox(
                width: 80,
                child: Text("validade", style: TextStyle(fontSize: 12, color: Colors.white70)),
              ),
              Text("cvv", style: TextStyle(fontSize: 12, color: Colors.white70)),
            ],
          ),
          Row(
            children: const [
              SizedBox(
                width: 80,
                child: Text("01/32", style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
              Text("123", style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
          const Spacer(), // Empurra os botões para o final do card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton("bloquear cartão"),
              _buildButton("excluir cartão"),
            ],
          )
        ],
      ),
    );
  }

  // Função para não repetir código de botão
  Widget _buildButton(String label) {
    return Container(
      width: 140,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
