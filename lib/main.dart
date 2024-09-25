import 'package:fast_food_2/Providers/food_Provider.dart';
import 'package:fast_food_2/Screens/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(

      ChangeNotifierProvider(
        create: (context) => FoodProvider(),
        child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FoodProvider(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:IntroPage()
      ),

    );
  }
}