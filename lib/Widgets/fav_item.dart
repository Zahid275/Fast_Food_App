import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  String imgPath;
  String itemName;
  int itemPrice;

  void Function()? deleteItem;

  FavItem({super.key,required this.imgPath,required this.itemName,
    required this.deleteItem,required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(22),
          boxShadow: const [BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 2,spreadRadius: 1,color: Colors.black54)],
          color:Colors.amber[200 ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: double.infinity,
              width:100,
              child:ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover
                  ,),
              ),
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemName,style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w700,color: Colors.brown),),
                  Text("Price: $itemPrice",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.brown),)
                ],
              ),
            ),

            Container(child: IconButton(
               onPressed: deleteItem
              ,icon: Icon(Icons.delete,size: 28,color: Colors.redAccent[200],),),)
          ],


        ),
      ),
    );
  }
}
