import 'package:flutter/material.dart';
import 'package:proekt/login2/Authorization.dart';
import 'package:proekt/modul/DataBase.dart';
import 'package:proekt/login/OpenPhoto.dart';




//Главный экран магазина
class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  _HomeState1 createState() => _HomeState1();
}

class _HomeState1 extends State<Home1> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('НА ВЁСЛАХ'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        itemCount: flowersList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(77),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionFlovers1(
                    id: flowersList[index].id,
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.network(
                  flowersList[index].fimage[0],
                  height: 200,
                  width: 200,
                  ),
                const SizedBox(height: 1),
                Text(
                  textAlign: TextAlign.center,
                  flowersList[index].name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  '${flowersList[index].price} Руб',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                  ),
                ),
                ],
                )
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
                Icons.local_grocery_store,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () => _dialogBuilder(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () => _dialogBuilder(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.home,//Гл.Экран
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
                ),
              onPressed: () {},
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
                        MaterialPageRoute(builder: (context) => const Authorization()
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


Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ошибка'),
          content: const Text(
            'Необходимо войти в свой аккаунт.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Закрыть'),
              onPressed: () {
                  Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}