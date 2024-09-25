import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodItem extends StatelessWidget {

  String itemImg;
  int itemPrice;
  String itemName;
  double rating;
  void Function()? onTap;

  FoodItem({super.key, required this.itemImg,required this.itemPrice,required this.onTap,required this.itemName,required this.rating});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 10,bottom: 5,right: 0,top: 2),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              boxShadow:const [BoxShadow(blurRadius: 2,spreadRadius: 1,offset: Offset(1, 2))],
                color: Colors.orange[50],

                borderRadius: BorderRadius.circular(11)
            ),

            child:
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170,
                    height: 100,
                    decoration: const BoxDecoration(


                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(itemImg,fit: BoxFit.cover,))

                  ),
                  const Divider(thickness: 1.4,),


                     Padding(
                       padding: const EdgeInsets.only(left: 5.0),
                       child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,


                        children: [
                          Text(
                                itemName,style: GoogleFonts.gelasio(fontSize:18,fontWeight: FontWeight.w500),

                                  ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$itemPrice Rs",style: TextStyle(fontSize: 20,color: Colors.grey.shade800),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$rating",style: TextStyle(fontSize: 20,color: Colors.grey.shade800),),
                          SizedBox(width: 5,),
                            Icon(Icons.star,color: Colors.amber,size: 20,),
                              SizedBox(width: 5,),

                            ],
                          )

                        ],
                                       ),
                     ),

                ],
              ),

          ),
        ),

    );
  }
}
