import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  const CoffeeTile({super.key, required this.coffeeImagePath, required this.coffeeName, required this.coffeePrice});
  
  @override
  Widget build(BuildContext context) {
    //wrap kaya fit content gt ver column
    return  Wrap(
    children: <Widget>[Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(right: 13),
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // COFFEE IMG
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(coffeeImagePath)),

            //COFFEE NAME
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeeName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'With Almond Milk',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    ),
                ),

              ]

            ),
            ),


            // PRICE
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore: prefer_interpolation_to_compose_strings
                  Text('Rp ' + coffeePrice),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 15,
                        )
                    ),
                  
                ],
              ),
            
          ],
        ))]);
    
  }
}
