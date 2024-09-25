import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:fast_food_2/Screens/itemPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Widgets/food_item.dart';

class HomePage extends StatelessWidget {

String? query;









  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, provider, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: SizedBox(
            height: 60,
            child: TextField(
              //Functional Part
              onChanged: (value){
                query = value;
                provider.searchItem(query.toString().trim());
              },



              ////Decoration Part
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white54,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Food items",
                  hintStyle: const TextStyle(fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.grey),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            "Fast Foods",
            style:
                GoogleFonts.gelasio(fontSize: 40, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: GridView.builder(
              itemCount:provider.foundItems.length,
              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FoodItem(
                    rating: provider.ratingList[index],
                    itemName: provider.foundItems[index]['name'],
                    itemImg: "assets/images/${provider.foundItems[index]['name'].toString().toLowerCase()}.jpg",
                    onTap: () {
                      provider.QuantityReset();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return Itempage(index: index);
                      },));

                    },
                    itemPrice: provider.foundItems[index]['price'],
                  ),
                );
              },
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,crossAxisSpacing: 0,mainAxisSpacing: 30,
                    childAspectRatio: 0.2/0.22
                  )),
        )
      ],
    )
    );
  }
}
