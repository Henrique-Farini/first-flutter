import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CarteiraDigital",
      home: const CarteiraDigital(),
    );
  }
}

class CarteiraDigital extends StatelessWidget {
  const CarteiraDigital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carteira Digital"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          CartaoBanco(
            corCartao: Color.fromARGB(255, 58, 183, 71),
            banco: "Banco SESI",
            numero: "1234 5678 9012 3456",
            nome: "Henrique Farini",
            validade: "12/30",
            logoMarca: AssetImage('assets/images/Sesi.jpg'),
          ),
          SizedBox(height: 20),
          CartaoBanco(
            corCartao: Color.fromARGB(255, 219, 132, 74),
            banco: "Inter",
            numero: "6965 4375 8962 7667",
            nome: "Henrique Farini",
            validade: "08/28",
            logoBandeira:
                AssetImage('assets/images/mastercard_itau_cartao.png'),
          ),
          SizedBox(height: 20),
           CartaoBanco(
            corCartao: Color.fromARGB(255, 147, 74, 219),
            banco: "Nubank",
            numero: "1233 4044 5435 4854",
            nome: "Henrique Farini",
            validade: "05/27",
            logoBandeira:AssetImage('assets/images/nubank.png'),
            logoMarca: AssetImage('assets/images/visa.png'),
          ),
        ],
      ),
    );
  }
}

class CartaoBanco extends StatelessWidget {
  final Color corCartao;
  final String banco;
  final String numero;
  final String nome;
  final String validade;
  final ImageProvider? logoBandeira;
  final ImageProvider? logoMarca;

  const CartaoBanco({
    super.key,
    required this.corCartao,
    required this.banco,
    required this.numero,
    required this.nome,
    required this.validade,
    this.logoBandeira,
    this.logoMarca,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: corCartao,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOPO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                banco,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  if (logoBandeira != null) ...[
                    Image(
                      image: logoBandeira!,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                  ],
                  const Icon(Icons.contactless, color: Colors.white),
                ],
              ),
            ],
          ),

        
          Row(
  children: [
    const Icon(Icons.sim_card, color: Colors.amber, size: 40),
    const Spacer(),
    if (logoMarca != null)
      Image(
        image: logoMarca!,
        width: 30,
        height: 30,
      ),
  ],
),

          // NÚMERO
          Text(
            numero,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),

          // RODAPÉ
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Titular",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Validade",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    validade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}