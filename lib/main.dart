import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/contastant.dart';
import 'package:movie_app/modules/home_screen.dart';
import 'package:movie_app/network/remote/remote_helper.dart';

import 'Helper/bloc_observer.dart';
import 'modules/layout_screen/layout.dart';
import 'modules/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MovieDioHelper.initMovie();
  SearchDioHelper.initSearch();
  SimilarMoviDioHelper.initMovie();
  WatchListDioHelper.initWatchList();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LayoutCubit()
              ..GetNowPlaying()
              ..GetPopular()
              ..GetTopRated()
              ..GetUpcoming()..GetWatchList()
        )
      ],
      child: MaterialApp(
        home:AnimatedSplashScreen(
          nextScreen: OnboardingScreen(),
          animationDuration: Duration(seconds: 1),
          duration: 3,
          backgroundColor: color,
          splashTransition: SplashTransition.scaleTransition,
          splashIconSize: 150,
          splash: 'assets/images/splash.png',
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: color,
            appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: color,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: color,
                    statusBarIconBrightness: Brightness.light),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ))),
      ),
    );
  }
}
