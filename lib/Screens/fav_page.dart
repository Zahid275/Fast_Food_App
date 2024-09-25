import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:fast_food_2/Widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, provider, child) =>
        Scaffold(
          backgroundColor: Colors.orange[50],

          body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text("Favourite Foods",style: GoogleFonts.gelasio(fontSize: 30,fontWeight: FontWeight.w700,),),

            Expanded(


                child: provider.favItemsList.isEmpty ? const Center(child: Text("No items have been added to favourites")):ListView.builder(
                  itemCount: provider.favItemsList.length,
                  itemBuilder: (context, index) {
                    return FavItem(

                      deleteItem: () {
                        provider.toggleItem(provider.itemList.indexOf(provider.itemList[index]));
                        provider.FavitemDel(provider.favItemsList[index]);
                        

                      },
                      itemPrice: provider.menuItems[provider.itemList.indexOf(provider.favItemsList[index])]["price"],
                    itemName:provider.favItemsList.toList()[index],imgPath: "assets/images/${provider.favItemsList.toList()[index].toString().toLowerCase()}.jpg", );



                  },


                )
            )

          ],
                ),
        ),
    );


  }
}
