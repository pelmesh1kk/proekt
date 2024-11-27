import 'package:flutter/material.dart';
import 'package:proekt/login/Home1.dart';
import 'package:proekt/History.dart';
import 'package:proekt/Cart.dart';
import 'package:proekt/Like.dart';
import 'package:proekt/Home.dart';
import 'package:proekt/modul/DataBase.dart';


//Экран Личного кабинета
class Account extends StatelessWidget {
  const Account ({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Личный кабинет'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  child: Image.network(data[0].image, 
                  fit: BoxFit.cover),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      height: 50, 
                      width: 300, 
                      color: Color.fromARGB(255, 0, 0, 0),
                    alignment: Alignment.center,
                       child: Text(data[0].name, 
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)
                            )
                          ),
                      ),
                      const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: 300,
                      color: Color.fromARGB(255, 0, 0, 0),
                      alignment: Alignment.center,
                      child: Text(
                      data[0].phonenumber, 
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)
                          )
                        ),
                      ),
                      const SizedBox(height: 20),
                    Container(
                      height: 50,
                    width: 300, 
                    color: Color.fromARGB(255, 0, 0, 0),
                    alignment: Alignment.center,
                     child:  Text(
                      data[0].email, 
                     style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255)
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
               SizedBox(
                    height: 50, //высота
                    width: 230, //ширина
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                child: const Text(
                  'История покупок',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, 
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(orderItems: orders),
                      )
                    );
                  },
                ),
               ),
            const SizedBox(height: 350),
            SizedBox(
                    height: 50, //высота
                    width: 170, //ширина
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                child: const Text(
                  'Выход',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17, 
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home1()
                        ),
                      );
                    },
            ),
            ),
          ]
        ),
      ),
       bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store,//Корзина
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cartItems: cart)
               ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,//Избранное
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikePage(likeItems: like)
               ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.home,//Гл.Экран
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
             onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()
                          ),
                        );
                },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,//Личный кабинет
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
