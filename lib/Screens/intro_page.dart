import 'package:fast_food_2/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                "assets/intro.png",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Food Feast",
              style: GoogleFonts.gelasio(
                fontSize: 44,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Your One-Store App For Delicious Meals,\n        Recipes And Restaurant Orders ",
              style: GoogleFonts.roboto(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: (){

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                return const Home();
              },));},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 65),
                width: double.maxFinite,
                height: 55,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(11)),child: const Center(child: Text("Get Started",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),)

              )),
            )


             ],
        ),
      ),
    );
  }
}
