import 'package:flutter/material.dart';
import 'package:proekt/login2/Password.dart';
import 'package:proekt/Home.dart';
import 'package:proekt/login2/Registration.dart';

// Экран авторизации
class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
      body: Center( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      image:  DecorationImage(
                        image: NetworkImage('https://www.clipartmax.com/png/full/258-2580995_sailtoindonesia-logo-sailtoindonesia-logo-yacht.png'), 
                      ),
                    ),
                ),
                const Text(
                  "НА ВЁСЛАХ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 50
                      ),
                ),
              ],
            ), 
          const SizedBox(height: 40),
          Container(
          width: 300,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20)
              )
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.android
                    ),
                  labelText: 'Введите логин',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock
                    ),
                  labelText: 'Введите пароль',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0), 
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Password()
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
               SizedBox(
                      width: 200,
                      height: 40, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: const Text(
                      'Регистрация', 
                        style: TextStyle(
                        fontSize: 20, 
                        color: Colors.black
                        )
                      ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registration()
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                      width: 200,
                      height: 40, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                    fontSize: 20, 
                    color: Colors.black
                    ),
                   ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}