import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import '../../contastant.dart';
import '../../network/end_points.dart';

Widget BuildFormField(
    {required TextEditingController controller,
    required void Function(String?) onSubmit}) {
  return Container(
    height: 45,
    child: TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmit,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'Search',
          contentPadding: EdgeInsets.only(left: 25, top: 4),
          suffixIconConstraints: BoxConstraints(maxHeight: 30, minWidth: 60),
          hintStyle: GoogleFonts.montserrat(
            color: Colors.grey,
          ),
          suffixIconColor: Colors.grey,
          filled: true,
          fillColor: Color(0xFF3A3F47),
          suffixIcon: Icon(
            CupertinoIcons.search,
            size: 27,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    ),
  );
}

Widget BuildPoster(
    {String? poster, int? index, double height = 240, bool item = false}) {
  return poster != null
      ? Container(
          height: height,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(item ? 25 : 15),
                child: Image.network(
                    fit: BoxFit.cover,
                    height: 210,
                    width: 145,
                    '$linkImage${poster}'),
              ),
              !item
                  ? Positioned(
                      top: 165,
                      left: 0,
                      child: Image.asset('assets/images/${index! + 1}.png'),
                    )
                  : Container()
            ],
          ),
        )
      : Container();
}

Container buildUnderLineOn() {
  return Container(
    width: 90,
    height: 4,
    color: Color(0xFF3A3F47),
  );
}

Container buildUnderLineOff() {
  return Container(width: 90, height: 4);
}

Widget BuildRowDetailsMovie(
    {required dynamic text, bool vote = true, required IconData icon}) {
  return Row(
    children: [
      Icon(
        icon,
        color: vote ? Colors.white : Color(0xFFFF8700),
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        text.toString(),
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: vote ? Colors.white : Color(0xFFFF8700),
        ),
      ),
    ],
  );
}

GestureDetector buildMoving(
    {required LayoutCubit cubit, required String text, required int index}) {
  return GestureDetector(
    onTap: () {
      cubit.ChangeIndex(index);
    },
    child: Column(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
        ),
        SizedBox(
          height: 12,
        ),
        cubit.index == index ? buildUnderLineOn() : buildUnderLineOff()
      ],
    ),
  );
}

Widget BuildButton({
  required String text,
  Color bkcolor = color,
  required double width,
  required double height,
  required void Function() onpress,
  bool border = false,
}) {
  return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
          side: border ? BorderSide(color: Colors.white, strokeAlign: 5) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: bkcolor,
          minimumSize: Size(width, height),
          maximumSize: Size(width, height)),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
      ));
}

Widget BuildTextFormField(
    {required String text,
      String? Function(String?)? validate,
      bool pass = true,
      required LayoutCubit cubit}) {
  return TextFormField(
    validator: validate,
    style: TextStyle(color: Colors.white),
    obscureText: pass?!cubit.visability:false,
    decoration: InputDecoration(
        hintText: text,
        suffixIcon: pass
            ? GestureDetector(
                onTap: () {
                  cubit.ChangevisiableIcon();
                },
                child: Icon(
                  cubit.visability?CupertinoIcons.eye:CupertinoIcons.eye_slash,
                  color: Colors.white,
                  size: 20,
                ))
            : null,
        hintStyle: GoogleFonts.poppins(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        disabledBorder: OutlineInputBorder()),
  );
}

Widget BuildBoxAuthentication({required String image, required String text}) {
  return Container(
    alignment: Alignment.center,
    width: 78,
    height: 78,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$image',
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
        )
      ],
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), color: Color(0xFF0D151F)),
  );
}
