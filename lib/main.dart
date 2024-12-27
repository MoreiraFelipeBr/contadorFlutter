import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement(){

      setState(() {
        count--;
      });


  }

  void increment(){
    setState(() {
      count++;
    });

  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;
  int get vazio => 20 - count;

  @override
  Widget build(BuildContext context) {
    //print("build");
    return  Scaffold(
      backgroundColor: Colors.white30,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                 isFull ? 'Lotado':'Podem entrar: $vazio',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                '$count',
                style:  TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null: decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.2): Colors.white,
                    fixedSize: const Size(100,80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:  Text( isEmpty ? '':'Saiu',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: isFull? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100,80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:  Text( isFull ? '' : 'Entrou',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



