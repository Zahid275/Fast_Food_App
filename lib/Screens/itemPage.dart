import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

int? index1;
class Itempage extends StatelessWidget {
  int index;



  Itempage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    index1 = index;

    return Consumer<FoodProvider>(
      builder: (context, provider, child) => Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 20),
          height: 90,
          width: double.maxFinite,
          color: Colors.orange[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: GestureDetector(                    ///1
                          onTap: provider.QuantityDec,
                          child: Container(
                              width: 40,
                              height: 40,
                              color: Colors.red,
                              child: Image.asset(
                                "assets/subtract.png",
                                color: Colors.amber[100],
                              )),
                        ),
                      ),
                    ),
                    Center(
                        child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "${provider.quantity}",
                        style: const TextStyle(fontSize: 23),
                      )),
                    )),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: InkWell(
                          onTap: provider.QuantityInc,
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.red,
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.amber[100],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: 160,
                child: ElevatedButton(                              ///2
                  onPressed: () {

                    provider.CartitemAdd(index);
                    print(index);
                    provider.CarPriceAdd(index);
                    provider.QuantityAdd(provider.quantity);
                    provider.TotalPriceListAdd(provider.quantity, provider.itemsPrices[index]);
                    print(provider.TotalPricetList);
                    print(provider.TotalPriceCalculate());



                    SnackBar snackbar  = SnackBar(
                        duration: Duration(milliseconds: 700),
                        content: Text("${provider.itemList[index]} has been added to cart"));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
            backgroundColor: Colors.orange[50],
            title: Center(
                child: Text(
              "Details      ",
              style: GoogleFonts.gelasio(
                  fontSize: 38, fontWeight: FontWeight.w700),
            ))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 17, right: 17, bottom: 17),
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(                                       ///3
                    "assets/images/${provider.itemList[index].toString().toLowerCase()}.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                                                                     ///4
                      provider.itemList[index],
                      style: GoogleFonts.gelasio(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Text(                                             ///5
                      "Price:  ${provider.itemsPrices[index]} Rs",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child:   Row(
                            children:  [
                              Text(
                                "Rating: ${provider.ratingList[index]} ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 28,
                              ),

                            ],
                          ),
                        ),
                        IconButton(onPressed: (){
                          provider.toggleItem(index);

                          if(provider.isFavList[index] == true){
                            provider.FavitemAdd(index);
                          }
                          else{
                            provider.FavitemDel(provider.itemList[index]);
                            provider.isFavList.remove(provider.itemList[index]);
                          }



                        },

                            icon:  Icon(provider.isFavList[index] == true ? Icons.favorite :Icons.favorite_border  ,size: 34,color: Colors.red,))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          provider.DesList[index],
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Icredients:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          provider.Icredients_List[index],
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
