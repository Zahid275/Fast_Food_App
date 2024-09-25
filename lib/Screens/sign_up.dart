import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: Column(
        children: [
          Text("Sign Up",style: GoogleFonts.gelasio(fontSize: 28,fontWeight: FontWeight.w700),)
          
        ],
      ),
    );
  }
}
