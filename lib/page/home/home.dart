import 'package:kopibabeh_shop/page/home/widgets/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopibabeh_shop/page/home/widgets/coffee_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //LIST OF COFFEE TYPES
  final List coffeeType = [
    // [ isi nya coffee type dan isSelected ]
    [
    'Black Coffee',
    true, 
    ],
    [
    'Coffee Latte',
    false,
    ],
    [
       'Cappucino',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  

  //USER TAPPED ON COFFE TYPES
  void coffeeTypeSelected(int index) {
    setState(() {

      // loop buat setiap selection false
      for(int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "kopi babeh",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.orange,
          ),),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.notifications, color: Colors.white,),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
            ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.airplane_ticket, 
            color: Colors.white,
            ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
            ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
            ),
          label: '',
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            // FIND BEST COFFEE
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                )
                ),
            ),

            // SEARCH BAR
                TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'type here..',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(14),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(14),
                  )
                ),
              ),
            
            const SizedBox(height: 10),
      
            // HORIZONTAL LIST VIEW COFFEE
            Container(
              height: 20,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0], 
                  isSelected: coffeeType[index][1], 
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              }
              )
            ),
      
      
            //HORIZONTAL LIST VIEW OF COFFIE TILES
            Expanded(
              child:  ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CoffeeTile(
                      coffeeImagePath: 'images/black coffee.jpg',
                      coffeeName: 'Black Coffee',
                      coffeePrice: '10.000',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'images/coffee latte love.jpg',
                      coffeeName: 'Latte Love',
                      coffeePrice: '10.000',
                    ),
                    CoffeeTile(
                      coffeeImagePath: 'images/coffee latte.jpg',
                      coffeeName: 'Coffee Latte',
                      coffeePrice: '10.000',
                    ),
                  ],
                        
              ))
          ],
        ),
      ),
    );
  }
}
