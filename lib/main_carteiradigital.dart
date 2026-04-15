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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meu Cartão"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
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
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                
                    const Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "validade",
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "cvv",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                
                    const Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "01/32",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 45),
                        Text(
                          "123",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                  
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "bloquear cartão",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "excluir cartão",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const CartaoModelo2(),

              
              const SizedBox(height: 20),

                const CartaoModelo3(),



            ],
          ),
        ),
      ),
    );
  }
}

class CartaoModelo2 extends StatelessWidget {
  const CartaoModelo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: Colors.black,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Row(
              children: [
                 const Text(
            "Tech",
            style: TextStyle(color: Colors.white70),),
          const SizedBox(width: 260),
          Icon(Icons.contactless, size: 25, color: Colors.white,)
              ],
            ),
            const SizedBox(height: 10,),

            const Icon(Icons.sim_card, size: 35, color: Color.fromARGB(255, 255, 187, 0),),

         
          const SizedBox(height: 15,),
          const Text(
            "5679 8028 1647 6596",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20,),
                      const Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          "Titular",
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 200),
                        Text(
                          "validade",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                     const Row(
                      children: [
                        SizedBox(width: 5),
                        
          SizedBox(height: 20),
           Text(
            "Henrique Farini",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 150),
            Text("08/29", style: TextStyle(color: Colors.white),)
                      ],
                    ),

        
        ],
      ),
    );

  }
}



class CartaoModelo3 extends StatelessWidget {
  const CartaoModelo3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF8A05BE),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Row(
              children: [
                 const Text(" "),
          const SizedBox(width: 240),
          Image.asset(
                          'assets/images/mastercard_itau_cartao.png',
                          width: 60,
                          height: 60,
                        ),
          
              ],
            ),
           

                Row(
              children: [
                 
               Image.asset('assets/images/chip3.png',
                          width: 60,
                          height: 60,
                        ),

                Icon(Icons.contactless, size: 25, color: Colors.white,)
              ],
            ),

            const SizedBox(height: 5,),
                   Row(
              children: [
                 
               Image.asset('assets/images/nubank1.png',
                          width: 50,
                          height: 50,
                        ),

                const Text("Henrique Farini", style: TextStyle(color: Colors.white, fontSize:    18, fontWeight: FontWeight.bold),)
              ],
            ),


              



        

        
        ],
      ),
    );

  }
}
