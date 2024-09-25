import 'package:fast_food_2/Screens/cart_page.dart';
import 'package:fast_food_2/Screens/fav_page.dart';
import 'package:flutter/material.dart';
import '../Screens/HomePage.dart';


List favItems = [];

class FoodProvider extends ChangeNotifier {
  var quantity = 1;
  FoodProvider(){
    _initialiser();
  }
  List<bool> isFavList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];



  toggleItem(int index){
    isFavList[index] =!  isFavList[index];
    notifyListeners();
  }








  ///Favourite Items List

  List favItemsList = [];


  ///adding favourite items  to a separate set
  /// when favourite button is clicked this function is called
  FavitemAdd(int index) {
    favItemsList.add(itemList[index]);

    notifyListeners();
  }



  ///Deleting favourite item from a favItemList set
  /// when delete button of fav item  is clicked this function is called
  FavitemDel(String  index) {
    favItemsList.remove(index);

    notifyListeners();
  }

  ///Cart Items Lists
  List cartItemList = [];
  List cartItemsPrices = [];
  List CartItemsQuantity = [];

  ///adding cart items  to a separate List
  /// when cart button is clicked this function is called
  CartitemAdd(int index) {
    cartItemList.add(itemList[index]);
    notifyListeners();
  }

  ///adding cart items prices to a separate List
  /// when cart button is clicked this function is called
  CarPriceAdd(int index) {
    cartItemsPrices.add(itemsPrices[index]);
    notifyListeners();
  }

  ///Deleting cart items from cartItemList
  /// when delete button  of cart item
  /// is clicked this function is called
  CartitemDel(int index) {
    cartItemList.removeAt(index);
    cartItemsPrices.removeAt(index);
    notifyListeners();
  }

  ///For adding the quantity into a list
  QuantityAdd(int quantity) {
    CartItemsQuantity.add(quantity);
    notifyListeners();
  }
  ///For Default Quantity Every Time
  QuantityReset() {
    quantity = 1;
  }


  List TotalPricetList = [];

  ///For calculating the total price of cart item by multiplying quantity and prize
  TotalPriceListAdd(int quantity, int price) {
    TotalPricetList.add(quantity * price);
  }

  ///For Deleting total prize
  DelTotalPrice(int index) {
    TotalPricetList.removeAt(index);
    TotalPriceCalculate();
    CartItemsQuantity.removeAt(index);
    notifyListeners();
  }

  ///For calculating the sum of all cart items prices to get the total bill
  TotalPriceCalculate() {
    double total = 0;
    for (int i = 0; i <= TotalPricetList.length - 1; i++) {
      total = total + TotalPricetList[i];
    }

    return total;
  }

  ///For increasing the quantity when "+" icon is clicked it is called
  QuantityInc() {
    quantity = quantity + 1;
    notifyListeners();
  }

  ///For decreasing the quantity when "-" icon is clicked it is called
  QuantityDec() {
    if (quantity > 1) {
      quantity = quantity - 1;
      notifyListeners();
    }
  }


  ///Screens Lists for handling bottom Navigation
  List ScreensList = [
     HomePage(),
    const CartPage(),
    const FavPage(),
  ];


  ///Food Items List
  List itemList = [
    "Cheese Burger",
    "Chicken Burger",
    "Chicken Pitas",
    "Chicken Roll",
    "French Fries",
    "Fried Chicken",
    "Fried Fish",
    "Garlic Roll",
    "Large pizza",
    "Medium Pizza",
    "Nuggets",
    "Onion Rings",
    "Sandwich",
    "Small Pizza",
    "Tacos",
    "Zinger Burger"
  ];

 /// Food Items Description List
  List DesList =
  [
    "Our Cheese Burger boasts a rich and savory beef patty, cooked to perfection and bursting with flavor. The patty is elevated by a generous slice of melted cheddar cheese, crispy bacon, fresh lettuce leaves, and thin tomato slices, all sandwiched between a soft and toasted whole wheat bun. Finished with a tangy dollop of mayonnaise and a sprinkle of paprika, this burger is a decadent and satisfying twist on the classic favorite.",
    "Our Chicken Burger features a perfectly seasoned ground chicken patty that's juicy and flavorful. The patty is complemented by a slice of sharp cheddar cheese, fresh tomato slices, and crisp lettuce leaves, all nestled in a toasted whole wheat bun. Topped with a creamy blend of mayonnaise and Dijon mustard, this burger is a delightful and healthier twist on the classic.",
    "Our Chicken Pitas are filled with tender, shredded chicken breast and fresh vegetables, including chopped lettuce, diced tomatoes, and sliced red onions. The warm whole wheat pita bread and cool, creamy tzatziki sauce make for a refreshing and satisfying meal.",
    "Our Chicken Roll is a flavorful wrap made with soft tortillas filled with shredded chicken, crisp lettuce, juicy tomatoes, and melted cheese. Finished with a drizzle of creamy ranch dressing, this roll is a perfect blend of textures and flavors.",
    "Our French Fries are made from fresh Russet potatoes, sliced to perfection and fried until golden and crispy. Lightly salted, they are the perfect side dish or snack.",
    "Our Fried Chicken is marinated in buttermilk and coated in a seasoned flour mixture before being fried to a crispy, golden brown. Juicy on the inside and crispy on the outside, it's a timeless favorite.",
    "Our Fried Fish features fresh fish fillets coated in a crispy bread crumb crust. Fried to a golden perfection, these fillets are light, flaky, and delicious.",
    "Our Garlic Roll is a soft bread roll brushed with a savory mixture of melted butter, garlic powder, and chopped parsley. Baked to golden perfection, it’s a perfect side for any meal.",
    "Our Large Pizza is a classic favorite featuring a crispy crust, tangy pizza sauce, and a generous layer of melted mozzarella cheese. Topped with pepperoni, bell peppers, and mushrooms, it's perfect for sharing.",
    "Our Medium Pizza offers a delightful combination of savory sausage crumbles, sweet onions, and tangy black olives atop a crispy crust and rich pizza sauce, all topped with gooey mozzarella cheese.",
    "Our Nuggets are made from tender chicken breast pieces coated in a crispy bread crumb crust. Fried to golden perfection, they're perfect for dipping in your favorite sauces.",
    "Our Onion Rings are crispy and golden, featuring thick slices of onion coated in a seasoned batter and fried until crunchy. They make a perfect appetizer or side dish.",
    "Our Sandwich is a classic delight with layers of sliced turkey breast, Swiss cheese, fresh lettuce, and tomato. Spread with creamy mayonnaise and a hint of Dijon mustard, it's all packed between two slices of whole grain bread.",
    "Our Small Pizza is perfect for one, featuring a crispy crust, tangy pizza sauce, and a layer of melted mozzarella cheese. Topped with pepperoni and diced onions, it's a tasty treat.",
    "Our Tacos are filled with seasoned ground beef, shredded lettuce, diced tomatoes, and cheddar cheese, all nestled in crispy taco shells. Topped with a dollop of sour cream, they’re a fiesta of flavors.",
    "Our Zinger Burger features spicy, crispy chicken fillets topped with pepper jack cheese, fresh lettuce, and tomato. All sandwiched between toasted burger buns and slathered with spicy mayo, it’s a fiery delight.",
  ];


  ///Food Items prizes list
  List itemsPrices = [
    300,
    260,
    230,
    100,
    100,
    220,
    160,
    120,
    2000,
    1200,
    220,
    120,
    100,
    800,
    140,
    300
  ];

  ///Food items rating List

  List ratingList = [
   3.9,
    4.5,
    4.2,
    3.9,
    4.5,
    4.2,
    5.0,
    3.0,
    3.9,
    4.5,
    4.2,
    5.0,
    3.0,
    5.0,
    3.0,
    4.9
  ];

  ///Food items incredients List

  List Icredients_List = [
    """
•  1 Pound Ground Beef
•  1 Egg
•  ½ Cup Bread Crumbs
•  1 Teaspoon Garlic Powder
•  1 Teaspoon Onion Powder
•  1 Teaspoon Paprika
•  Salt and Pepper to Taste
•  4 Whole Wheat Burger Buns
•  8 Slices Cheddar Cheese
•  2 Tomatoes, Sliced
•  4 Lettuce Leaves
•  4 Tablespoons Mayonnaise
•  2 Tablespoons Ketchup
•  6 Slices of Bacon
 
    
    
    """
    ,
    """
• 1 Pound Ground Chicken
• 1 Egg
• ½ Cup Bread Crumbs
• 1 Teaspoon Garlic Powder
• 1 Teaspoon Onion Powder
• Salt and Pepper to Taste
• 4 Whole Wheat Burger Buns
• 4 Slices Cheddar Cheese
• 1 Tomato, Sliced
• 4 Lettuce Leaves
• 4 Tablespoons Mayonnaise
• 1 Tablespoon Dijon Mustard
    """,
    """   
• 2 Cups Cooked Chicken Breast, Shredded
• 4 Whole Wheat Pita Breads
• 1 Cup Chopped Lettuce
• 1 Cup Diced Tomatoes
• ½ Cup Sliced Red Onions
• 1 Cup Tzatziki Sauce
""",
    """" 
• 2 Cups Cooked Chicken, Shredded
• 4 Tortillas
• 1 Cup Shredded Lettuce
• 1 Cup Diced Tomatoes
• ½ Cup Shredded Cheese
• 4 Tablespoons Ranch Dressing
  """,
    """
• 4 Large Russet Potatoes
• 2 Tablespoons Olive Oil
• Salt to Taste
 """,

    """ 
• 1 Whole Chicken, Cut into Pieces
• 2 Cups Buttermilk
• 2 Cups All-Purpose Flour
• 1 Tablespoon Paprika
• 1 Teaspoon Garlic Powder
• 1 Teaspoon Onion Powder
• Salt and Pepper to Taste
• Vegetable Oil for Frying    
    """,

    """ 
• 4 Fish Fillets
• 1 Cup All-Purpose Flour
• 2 Eggs, Beaten
• 1 Cup Bread Crumbs
• Salt and Pepper to Taste
• Vegetable Oil for Frying 
    """,

    """ • 4 Bread Rolls
• 4 Tablespoons Butter, Melted
• 2 Teaspoons Garlic Powder
• 1 Tablespoon Chopped Parsley
    """,
    """ 
• 1 Large Pizza Dough
• 1 Cup Pizza Sauce
• 2 Cups Shredded Mozzarella Cheese
• 1 Cup Pepperoni Slices
• 1 Cup Sliced Bell Peppers
• 1 Cup Sliced Mushrooms
     """,
    """     
• 1 Medium Pizza Dough
• 1 Cup Pizza Sauce
• 2 Cups Shredded Mozzarella Cheese
• 1 Cup Pepperoni Slices
• 1 Cup Sliced Bell Peppers
• 1 Cup Sliced Mushrooms
    """,

    """ 
• 1 Pound Chicken Breast, Cut into Nuggets
• 1 Cup All-Purpose Flour
• 2 Eggs, Beaten
• 1 Cup Bread Crumbs
• Salt and Pepper to Taste
• Vegetable Oil for Frying
     """,
    """  
• 2 Large Onions, Sliced into Rings
• 1 Cup All-Purpose Flour
• 1 Cup Buttermilk
• 1 Cup Bread Crumbs
• Salt to Taste
• Vegetable Oil for Frying
    """,

    """  
• 2 Slices of Whole Grain Bread
• 4 Ounces Sliced Turkey Breast
• 2 Slices Swiss Cheese
• 2 Leaves of Romaine Lettuce
• 2 Slices Tomato
• 2 Tablespoons Mayonnaise
• 1 Teaspoon Dijon Mustard
    """,

    """ 
• 1 Small Pizza Dough
• ½ Cup Pizza Sauce
• 1 Cup Shredded Mozzarella Cheese
• ½ Cup Sliced Pepperoni
• ¼ Cup Diced Onions    
    """,

    """
• 1 Pound Ground Beef
• 1 Packet Taco Seasoning
• 8 Taco Shells
• 1 Cup Shredded Lettuce
• 1 Cup Diced Tomatoes
• 1 Cup Shredded Cheddar Cheese
• ½ Cup Sour Cream
    """,

    """ 
• 1 Pound Chicken Breast,
  Cut into Fillets
• 1 Cup Buttermilk
• 1 Cup All-Purpose Flour
• 1 Teaspoon Paprika
• 1 Teaspoon Garlic Powder
• Salt and Pepper to Taste
• 4 Burger Buns
• 4 Slices Pepper Jack Cheese
• 4 Leaves Romaine Lettuce
• 4 Slices Tomato
• 4 Tablespoons Spicy Mayo
    """,

  ];

  int selectedIndex = 0;

  onTapChange(value) {
    selectedIndex = value;
    notifyListeners();
  }




///For Search Box
  List<Map<String, dynamic>> menuItems = [];
  List<Map<String, dynamic>> foundItems = [];



  ///Converting items list and prizes list in a jason like format map into List
  ///Because we have to filter items using searchbox
  ///this function is called when app is started
  void _initialiser(){
    for(int i = 0;i<itemList.length;i++){
      menuItems.add(
        {'name':itemList[i],'price':itemsPrices[i],"isFav":isFavList[i]},
      );
    }
    print(menuItems);
    foundItems = menuItems;
    notifyListeners();

  }
  ///For filtering items
  searchItem( keyword){
    if(keyword.isEmpty){
      foundItems = menuItems;

    }
    else{
     foundItems = menuItems.where((item ) =>item['name'].toString().toLowerCase().contains(keyword.toString().toLowerCase())).toList();

    }
notifyListeners();
  }



}















