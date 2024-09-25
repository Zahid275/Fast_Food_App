import 'package:flutter/material.dart';

class Cartitem extends StatelessWidget {
  String imgPath;
  String ItemName;
  int itemPrice;
  int quantity;
  void Function()? deleteItem;

  Cartitem({super.key,required this.quantity ,required this.imgPath,required this.ItemName,required this.itemPrice,required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(22),
          boxShadow: const [BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 2,spreadRadius: 1,color: Colors.black54)],
          color:Colors.amber[200 ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: double.infinity,
              width:100,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image(image: AssetImage(imgPath),fit: BoxFit.cover
                  ,),
              ),
            ),
            const SizedBox(width: 10,),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(ItemName,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.brown),),
                        Text("$itemPrice Rs",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black54),),
                        Text("Quantity: $quantity",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black54),)

                      ],
                    ),
                  ),

                  Container(child: IconButton(onPressed: deleteItem
                    ,icon: Icon(Icons.delete,size: 35,color: Colors.redAccent[200],),),),
                ],
              ),
            )
          ],


        ),
      ),
    );
  }
}
