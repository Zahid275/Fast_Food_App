import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:fast_food_2/Widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(
      builder: (BuildContext context, provider, Widget? child)
    {
      return Scaffold(

        backgroundColor: Colors.orange[50],
        bottomNavigationBar: Container(
          height: 70,width: double.infinity,
          color: Colors.amber.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Text("Total : ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
                  Text(provider.TotalPriceCalculate().toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  onPressed: (){
                    SnackBar snackBar = const SnackBar(
                        duration: Duration(seconds: 4),

                        content: Text("Thank you for your order! It's being prepared for delivery and will arrive soon.",style: TextStyle(fontSize: 14),));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text("Order Now",style: TextStyle(fontSize: 16,color: Colors.brown),))
            ],
          ),
        
        ),
        body:

        Column(
          children: [

            SizedBox(height: 60,),
            Text("Cart Items",style: GoogleFonts.gelasio(fontSize: 30,fontWeight: FontWeight.w700,),),
            Expanded(

                child: provider.cartItemList.isEmpty ? const Center(child: Text("No items have been added to cart"),):
                ListView.builder(
                  itemCount: provider.cartItemList.length,
                  itemBuilder: (context, index) {
                  return Cartitem(deleteItem:(){
                    provider.CartitemDel(index);
                    provider.DelTotalPrice(index);
                  },ItemName:provider.cartItemList[index],imgPath: "assets/images/${provider.cartItemList[index].toString().toLowerCase()}.jpg", itemPrice: provider.cartItemsPrices[index],quantity: provider.CartItemsQuantity[index],);



                },


            )
            )
          ],
        ),
      );

},);}}