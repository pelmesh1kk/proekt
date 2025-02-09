  import 'package:flutter/material.dart';
  import 'package:smooth_page_indicator/smooth_page_indicator.dart';
  import 'package:carousel_slider/carousel_slider.dart';
  import 'package:proekt/modul/DataBase.dart';
  import 'package:proekt/Like.dart';
  import 'package:proekt/Cart.dart';
  import 'package:proekt/Home.dart';
  import 'package:proekt/PersonalAccount.dart';
  import 'package:proekt/Purchase.dart';



  //Подробная информация о цветах
  class DescriptionFlovers extends StatefulWidget {
    final int id;

    const DescriptionFlovers({
      Key? key,
      required this.id,
    }) : super(key: key);


  @override
    _DescriptionFloversState createState() => _DescriptionFloversState();
  }

  class _DescriptionFloversState extends State<DescriptionFlovers> {
    int activeIndex = 1;
    bool isLiked = false;
   
  @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(flowersList[widget.id].name), 
          centerTitle: true,
        ),
        body: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                itemCount: flowersList[widget.id].fimage.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Image.network(flowersList[widget.id].fimage[index]),
                  );
                },
              ),
              const SizedBox(height: 30),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: flowersList[widget.id].fimage.length,
              ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    padding: const EdgeInsets.only(left: 20, right: 20
                    ),
                    height: 200, 
                    width: 400, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          flowersList[widget.id].name, 
                          style: const TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                        const SizedBox(height: 10), 
                        Text(
                          '${flowersList[widget.id].price} Руб',
                          style: const TextStyle(
                          fontSize: 19, 
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                        const SizedBox(height: 10), 
                     IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 30,
                          color: isLiked ? Color.fromARGB(255, 255, 0, 179) : Color.fromARGB(255, 255, 255, 255), 
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                            if (isLiked) {
                              like.add(flowersList[widget.id]);
                            } else {
                              like.remove(flowersList[widget.id]);
                            }
                          }
                          );
                        },
                      ),
                        ]
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70, //высота
                    width: 170, //ширина
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  child: const Text(
                    'В корзину',
                    style: TextStyle(
                    fontSize: 18, 
                    color: Color.fromARGB(255, 255, 255, 255)
                   ),
                   ),
                    onPressed: () {
                      setState(() {
                        if (!cart.contains(flowersList[widget.id])) {
                         cart.add(flowersList[widget.id]);
                        } else {
                       cart.remove(flowersList[widget.id]);
                      }
                    }
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Товар  добавлен.'), 
                    duration: Duration(
                      seconds: 2
                      )
                    ),
                  );
                },
              ),
            ),   
            const SizedBox(width: 20),
            SizedBox(
              height: 70, //высота
              width: 170, //ширина
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Купить сейчас',
                    style: TextStyle(
                    fontSize: 18, 
                    color: Color.fromARGB(255, 255, 255, 255)
                   ),
                  ),
          onPressed: () {
                setState(() {
                  cart.add(flowersList[widget.id]);
                });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Purchase(),
                ),
              );
            },
            ),
            ), 
                ],
              ),
                  ),
              
              const SizedBox(height: 20), 
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25
                    ),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                padding: const EdgeInsets.only(
                  left: 20,  
                  right: 20
                ),
                height: 750, //высота
                width: 400, //ширина
                  child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Характеристики:", 
                          style: TextStyle(fontSize: 23, 
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          color:Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(height: 20
                        ),
                        Text(
                          flowersList[widget.id].specifications,
                          style: const TextStyle(fontSize: 20, 
                          color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                        ],
                    ),
                    ),
                  ),
                  
                const SizedBox(height: 25),
                ],
              ),
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
