import 'package:flutter/material.dart';
import 'quote.dart';
import 'drink_info.dart';

void main() => runApp(MaterialApp(
  home: MainScreen(),
));

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Drink> drinks = [
  Drink(id: 1001, category: 'Hot', name: 'Cappuccino', price: 15.59, desc: 'A nice Cappuccino cup', info: 'Outside of Italy, cappuccino is a coffee drink that today is typically composed of double espresso and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso macchine. The double espreso os poured into the bottomof the cip, followed by a similar amount of hot milk, which is prepared by heating and texturing the milk using the espresso machine steam wand. The top third of th drink consistes of milk foam; this foam can be decorated with artisticc drawings made with the same milk, called latte art.', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyvzUsyUP5X04P-EatqPsU7pBn2TZYq-fR_yI2H816GiAgeH1N&s'),
  Drink(id: 1002, category: 'Cold', name: 'Iced Mocha', price: 5, desc: 'A nice Mocha cup', info: 'Iced coffee is a type of caffee beverage servaed cilled, brewed variously with the fundamental division veing cold brew - brewed the coffee cold, yielding a different flavour, and not requiring cooling - or brewing normaly (hot) and the cooling, generally by simply pouring over ice or into ice cold milk. In hot brewing, sweeteners and flavourings are often mixed into the hot coffee before cooling, due to faster dissolution in hot warter. Alternatively, syrup (sugar pre-dissolved in water) may be used, paticularly gum syrup.', img: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/06/22/15/Costa-Coffee.jpg?w968h681'),
  Drink(id: 1003, category: 'Hot', name: 'Take Away', price: 2.35, desc: 'A nice takeaway cup', info: 'Blaaa', img: 'https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/05/03/11/costa.jpg?w968')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('COFFEE DB',
        style: TextStyle(fontSize: 30.0),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text("Hot Drinks",
                    style: TextStyle(fontSize: 30.0, color: Colors.white,),
                  ),
                ),
                drinksListView(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container drinksListView(BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: drinks.length, itemBuilder: (context, index) {
                      final drink = drinks[index];
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: InkWell(
                      onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(drink: drink)),
                      );},
                      child: Card(
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    image: NetworkImage(drink.img.toString()),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                drink.name.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              drink.desc.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
  }
}



