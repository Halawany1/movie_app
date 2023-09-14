import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/Shared/shared_component/component.dart';
import 'package:movie_app/contastant.dart';
import 'package:movie_app/modules/layout_screen/layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    List text=[
      'Welcome!',
      'Welcome Back!'
    ];
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Scaffold(
          backgroundColor: color,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 58.0, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      text[cubit.index],
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.ChangeIndex(0);
                          },
                          child: buildColumn(text: 'Signup',
                              color: cubit.index == 0 ? true : false),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.ChangeIndex(1);
                          },
                          child: buildColumn(text: 'Login',
                              color: cubit.index == 1 ? true : false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if(cubit.index == 0)
                      Column(
                        children: [
                          Text(
                            'Please register for an account ',
                            style:
                            GoogleFonts.poppins(fontSize: 16, color: Colors
                                .white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(text: 'Email Address', pass: false,cubit: cubit),
                          SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(text: 'Password', pass: true,cubit: cubit),
                          SizedBox(
                            height: 20,
                          ),
                          BuildTextFormField(
                              text: 'Confirm Password', pass: true,cubit: cubit),
                          SizedBox(
                            height: 30,
                          ),
                          BuildButton(
                              text: 'Signup',
                              width: double.infinity,
                              height: 52,
                              bkcolor: Color(0xFF0296E5).withOpacity(0.8),
                              onpress: () {

                              }),
                          SizedBox(
                            height: 50,
                          ),
                          Row(children: [
                            Container(width: 110,
                              color: Colors.white,
                              height: 1,),
                            SizedBox(width: 15,),
                            Text('or Sign up with', style: GoogleFonts.roboto(
                                fontSize: 16, color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(width: 15,),
                            Container(width: 110,
                              height: 1,
                              color: Colors.white,),
                          ],),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BuildBoxAuthentication(
                                  image: 'google.png', text: 'Google'),
                              SizedBox(width: 30,),
                              BuildBoxAuthentication(
                                  image: 'apple.png', text: 'Apple'),
                              SizedBox(width: 30,),
                              BuildBoxAuthentication(
                                  image: 'facebook.png', text: 'Facebook'),
                            ],
                          ), SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white
                                ),),
                              SizedBox(width: 5,),
                              Text('Login', style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, color: Colors.white
                              ),),
                            ],
                          )
                        ],
                      )

                    else if(cubit.index == 1)
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                'Please login for an account ',
                                style:
                                GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              BuildTextFormField(
                                validate: (value) {
                                  if(value!.isEmpty){
                                    return "Email Address must be found";
                                  }
                                  return null;
                                },
                                  text: 'Email Address', pass: false,cubit: cubit),
                              SizedBox(
                                height: 20,
                              ),
                              BuildTextFormField(
                                  validate: (value) {
                                    if(value!.isEmpty){
                                      return "Password must be found";
                                    }
                                    return null;
                                  },
                                  text: 'Password', pass: true,cubit: cubit),
                              SizedBox(
                                height: 30,
                              ),
                              BuildButton(
                                  text: 'Login',
                                  width: double.infinity,
                                  height: 52,
                                  bkcolor: Color(0xFF0296E5).withOpacity(0.8),
                                  onpress: () {
                                    if(formKey.currentState!.validate()) {
                                      cubit.index=0;
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LayoutScreen(),));
                                    }
                                  }),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Forgot Password', style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(children: [
                                Container(width: 115,
                                  color: Colors.white,
                                  height: 1,),
                                SizedBox(width: 15,),
                                Text('or Login with', style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),),
                                SizedBox(width: 15,),
                                Container(width: 115,
                                  height: 1,
                                  color: Colors.white,),
                              ],),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BuildBoxAuthentication(
                                      image: 'google.png', text: 'Google'),
                                  SizedBox(width: 30,),
                                  BuildBoxAuthentication(
                                      image: 'apple.png', text: 'Apple'),
                                  SizedBox(width: 30,),
                                  BuildBoxAuthentication(
                                      image: 'facebook.png', text: 'Facebook'),
                                ],
                              ), SizedBox(height: 35),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("don't have an account?",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white
                                    ),),
                                  SizedBox(width: 5,),
                                  Text('Create Account', style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16, color: Colors.white
                                  ),),
                                ],
                              )
                            ],
                          ),
                        )

                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }

  Column buildColumn({required String text, required bool color}) {
    return Column(
      children: [
        Text(text,
            style: GoogleFonts.poppins(
                fontWeight: color ? FontWeight.bold : null,
                fontSize: 24,
                color: Colors.white)),
        if (color)
          Container(
            width: 88,
            height: 2.5,
            color: Colors.white,
          )
      ],
    );
  }
}
