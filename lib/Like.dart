import 'package:flutter/material.dart';
import 'package:proekt/modul/DataBase.dart';
import 'package:proekt/Boats.dart';
import 'package:proekt/Cart.dart';
import 'package:proekt/Home.dart';
import 'package:proekt/PersonalAccount.dart';

//Экран Избранного
class LikePage extends StatelessWidget {
  final List<Flowers> likeItems;

  LikePage({required this.likeItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Избранное'),
      ),
      body: ListView.builder(
        itemCount: likeItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              like.removeAt(index);
            },
            direction: DismissDirection.endToStart, 
            background: Container(
              color: Color.fromARGB(255, 255, 0, 0),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete, 
                color: Colors.white
                ),
            ),
            child: ListTile(
              leading: Image.network(
                likeItems[index].fimage[0],
                width: 50,
                height: 50,
              ),
              title: Text(
                likeItems[index].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${likeItems[index].price} Руб',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DescriptionFlovers(
                        id: flowersList[index].id,
                  )),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.local_grocery_store, //Корзина
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cartItems: cart)),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border, //Избранное
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.home, //Гл.Экран
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
