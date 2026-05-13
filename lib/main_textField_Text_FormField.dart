import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaComparacao(),
    );
  }
}

class TelaComparacao extends StatefulWidget {
  const TelaComparacao({super.key});

  @override
  State<TelaComparacao> createState() => _TelaComparacaoState();
}

class _TelaComparacaoState extends State<TelaComparacao> {
  
  final controllerSimples = TextEditingController();
  final controllerForm = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controllerSimples.dispose();
    controllerForm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField vs TextFormField'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            const Text(
              "TextField Simples:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controllerSimples,

              decoration: const InputDecoration(
                labelText: 'Digite algo',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                print(
                  "TextField Simples: ${controllerSimples.text}",
                );
              },

              child: const Text(
                'Mostrar TextField Simples',
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "TextFormField com Validação:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Form(
              key: _formKey,

              child: Column(
                children: [

                  TextFormField(
                    controller: controllerForm,

                    decoration: const InputDecoration(
                      labelText: 'Digite seu nome',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {

                      if (_formKey.currentState!.validate()) {

                        print(
                          "TextFormField válido: ${controllerForm.text}",
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Formulário válido!'),
                          ),
                        );
                      }
                    },

                    child: const Text(
                      'Validar Formulário',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}