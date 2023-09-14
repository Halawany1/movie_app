import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Shared/shared_component/component.dart';
import 'package:movie_app/modules/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            left: 20,
            bottom: 310,
            child: Text('Downloads',
                style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ),
          Positioned(
            left: 20,
            bottom: 250,
            child: Text(
                'Download movies and watch them offline\n'
                    'at your own convenience',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
          ),
          Positioned(
              left: 20,
              bottom: 60,
              child: BuildButton(text: 'Signup',
                  border: true,
                  width: 167,
                  height: 49,
                  bkcolor: Colors.transparent,
                  onpress: () {
                    Navigator
                        .pushReplacement(context, MaterialPageRoute(builder: (context)
                    =>
                        LoginScreen())
                    );
                  })
          ),
          Positioned(
              right: 20,
              bottom: 60,
              child: BuildButton(text: 'Login',
                  width: 167, height: 50,
                  onpress: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),));
                  })
          ),
        ],
      ),
    );
  }
}
