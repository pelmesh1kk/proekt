import 'package:flutter/material.dart';
import 'package:proekt/modul/DataBase.dart';
import 'package:proekt/Home.dart';
import 'package:proekt/Like.dart';
import 'package:proekt/Cart.dart';
import 'package:proekt/PersonalAccount.dart';

//Экран истории зказов
class OrderDetailsScreen extends StatelessWidget {
  final List<Flowers> orderItems;

  const OrderDetailsScreen({Key? key, required this.orderItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('История заказов'),
      ),
      body: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          final flower = orderItems[index];
          return ListTile(
            leading: Image.network(flower.fimage[0], 
            width: 50, 
            height: 50, 
            ), 
            title: Text(flower.name,
            style: const TextStyle(
                fontSize: 17, 
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text('Кол-во: ${flower.quantity}, Стоимость: ${flower.quantity * flower.price} Руб',
            style: const TextStyle(
                    fontSize: 15, 
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
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
                onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Account()
                          ),
                        );
                      },
              ),
            ],
          ),
        ),
    );
  }
}