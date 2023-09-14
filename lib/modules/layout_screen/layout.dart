import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/contastant.dart';
import 'package:movie_app/modules/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(
      builder: (context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          body: cubit.screens[cubit.indexNavbar],
          bottomNavigationBar: Container(
            height: 60,
            //color:Color(0xFF0296E5)
            child: Stack(
             children: [
               BottomNavigationBar(
                 type: BottomNavigationBarType.fixed,
                 backgroundColor: color,
                 onTap: (value) {
                   cubit.ChangeIndexNavBar(value);
                 },
                 currentIndex: cubit.indexNavbar,
                 selectedItemColor: Color(0xFF0296E5),
                 unselectedItemColor: Color(0xFF67686D),
                 items: [
                   BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: 'Home'),
                   BottomNavigationBarItem(icon: Icon(Icons.search,size: 30),label: 'Search'),
                   BottomNavigationBarItem(icon: Icon(Icons.bookmark_border,size: 30),label: 'Watch list'),
                 ],

               ),
               Container(width: double.infinity,height: 1.5,color:Color(0xFF0296E5))
             ],
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}
