import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.orange[100],
        bottomNavigationBar: SizedBox(
          height: 90,
          child: GNav(
            gap: 8,
            tabBorderRadius: 30,
            iconSize: 30,
            activeColor: Colors.brown,
            color: Colors.brown,
            backgroundColor: Colors.brown.shade100,
            tabBackgroundColor: Colors.orange.shade100,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: "Cart",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favourites",
              ),


            ],
            selectedIndex: provider.selectedIndex,
            onTabChange: (value) {
              provider.onTapChange(value);
            },
          ),
        ),

        body: provider.ScreensList[provider.selectedIndex]
      );
    });
  }
}
