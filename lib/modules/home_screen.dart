import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/contastant.dart';
import 'package:movie_app/modules/details_screen.dart';

import '../Shared/shared_component/component.dart';
import '../network/end_points.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
                size: 0,
                color: color
            ),
            titleSpacing: 20,
            title: Text(
              "What do you want to watch?",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.movieModel != null,
            builder: (context) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      BuildFormField(
                        controller: searchController,
                        onSubmit: (p0) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 240,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                InkWell(
                                  onTap: () {
                                    cubit.GetSimilarMovie(cubit.popularMovieModel!.
                                    results![index].id as int);
                                    cubit.GetRecommendation(cubit.popularMovieModel!.
                                    results![index].id as int);
                                    cubit.GetCast(cubit
                                        .popularMovieModel!.results![index]
                                        .id as int);
                                    cubit.GetDetailsMovie(cubit
                                        .popularMovieModel!.results![index]
                                        .id as int);
                                    cubit.GetReview(cubit
                                        .popularMovieModel!.results![index]
                                        .id as int);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(index),
                                        ));
                                  },
                                  child: BuildPoster(
                                      poster: cubit.popularMovieModel!
                                          .results![index]
                                          .posterPath as String,
                                      index: index),
                                ),
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  width: 20,
                                ),
                            itemCount: 5),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            buildMoving(
                                cubit: cubit, text: 'Now Playing', index: 0),
                            SizedBox(width: 8),
                            buildMoving(
                                cubit: cubit, text: 'Upcoming', index: 1),
                            SizedBox(width: 8),
                            buildMoving(
                                cubit: cubit, text: 'Top Rated', index: 2),
                            SizedBox(width: 8),
                            buildMoving(
                                cubit: cubit, text: 'Popular', index: 3),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cubit.index == 0
                            ? cubit.movieModel!.results!.length
                            : cubit.index == 1
                            ? cubit.upcomingMovieModel!.results!.length
                            : cubit.index == 2
                            ? cubit.topRatedMovieModel!.results!.length
                            : cubit.popularMovieModel!.results!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.63,
                            crossAxisSpacing: 15),
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: () {
                                cubit.index == 0
                                    ? cubit.GetDetailsMovie(
                                    cubit.movieModel!.results![index].id as int)
                                    : cubit.index == 1
                                    ? cubit.GetDetailsMovie(cubit
                                    .upcomingMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.index == 2
                                    ? cubit.GetDetailsMovie(cubit
                                    .topRatedMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.GetDetailsMovie(cubit
                                    .popularMovieModel!
                                    .results![index]
                                    .id as int);

                                cubit.index == 0
                                    ? cubit.GetSimilarMovie(
                                    cubit.movieModel!.results![index].id as int)
                                    : cubit.index == 1
                                    ? cubit.GetSimilarMovie(cubit
                                    .upcomingMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.index == 2
                                    ? cubit.GetSimilarMovie(cubit
                                    .topRatedMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.GetSimilarMovie(cubit
                                    .popularMovieModel!
                                    .results![index]
                                    .id as int);

                                cubit.index == 0
                                    ? cubit.GetCast(
                                    cubit.movieModel!.results![index].id as int)
                                    : cubit.index == 1
                                    ? cubit.GetCast(cubit.upcomingMovieModel!
                                    .results![index].id as int)
                                    : cubit.index == 2
                                    ? cubit.GetCast(cubit
                                    .topRatedMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.GetCast(cubit.popularMovieModel!
                                    .results![index].id as int);

                                cubit.index == 0
                                    ? cubit.GetRecommendation(
                                    cubit.movieModel!.results![index].id as int)
                                    : cubit.index == 1
                                    ? cubit.GetRecommendation(cubit.upcomingMovieModel!
                                    .results![index].id as int)
                                    : cubit.index == 2
                                    ? cubit.GetRecommendation(cubit
                                    .topRatedMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.GetRecommendation(cubit.popularMovieModel!
                                    .results![index].id as int);

                                cubit.index == 0
                                    ? cubit.GetReview(
                                    cubit.movieModel!.results![index].id as int)
                                    : cubit.index == 1
                                    ? cubit.GetReview(cubit.upcomingMovieModel!
                                    .results![index].id as int)
                                    : cubit.index == 2
                                    ? cubit.GetReview(cubit
                                    .topRatedMovieModel!
                                    .results![index]
                                    .id as int)
                                    : cubit.GetReview(cubit
                                    .popularMovieModel!
                                    .results![index]
                                    .id as int);

                                cubit.index == 0
                                    ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(index),
                                    ))
                                    : cubit.index == 1
                                    ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(index),
                                    ))
                                    : cubit.index == 2
                                    ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(index),
                                    ))
                                    : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(index),
                                    ));
                                cubit.index = 0;
                              },
                              child: BuildPoster(
                                  poster: cubit.index == 0
                                      ? cubit.movieModel!.results![index]
                                      .posterPath
                                  as String
                                      : cubit.index == 1
                                      ? cubit.upcomingMovieModel!
                                      .results![index].posterPath as String
                                      : cubit.index == 2
                                      ? cubit
                                      .topRatedMovieModel!
                                      .results![index]
                                      .posterPath as String
                                      : cubit
                                      .popularMovieModel!
                                      .results![index]
                                      .posterPath as String,
                                  item: true,
                                  index: index),
                            ),
                      )
                    ],
                  ),
                ),
              );
            },
            fallback: (context) =>
                Center(
                    child: CircularProgressIndicator()),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
