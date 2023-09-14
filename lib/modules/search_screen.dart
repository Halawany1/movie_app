import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/contastant.dart';
import 'package:movie_app/modules/home_screen.dart';

import '../Shared/shared_component/component.dart';
import '../network/end_points.dart';
import 'details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.index=0;
                  cubit.ChangeIndexNavBar(0);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 25,
                ),
              )
            ],
            title: Text(
              'Search',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  BuildFormField(
                      controller: searchController,
                      onSubmit: (value) {
                        cubit.GetSearchMovie(value.toString());
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  ConditionalBuilder(
                    builder: (context) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cubit.searchModel!.results!.length,
                        itemBuilder: (context, index) => cubit
                                    .searchModel!.results![index].posterPath !=
                                null
                            ? InkWell(
                          onTap: () {
                            cubit.GetRecommendation(cubit
                                .searchModel!.results![index].id as int);
                            cubit.GetSimilarMovie(cubit
                                .searchModel!.results![index].id as int);
                            cubit.GetCast(cubit
                                .searchModel!.results![index].id as int);
                            cubit.GetDetailsMovie(cubit
                                .searchModel!.results![index].id as int);
                            cubit.GetReview(
                                cubit.searchModel!.results![index].id as int);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(index),
                                ));
                          },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BuildPoster(
                                        item: true,
                                        poster: cubit.searchModel!.results![index]
                                            .posterPath,
                                        index: index),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            '${cubit.searchModel!.results![index].originalTitle}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          BuildRowDetailsMovie(
                                              text: cubit.searchModel!
                                                  .results![index].voteAverage
                                                  .toStringAsFixed(1),
                                              vote: false,
                                              icon: Icons
                                                  .star_border_purple500_outlined),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          BuildRowDetailsMovie(
                                              text: cubit.searchModel!
                                                  .results![index].popularity,
                                              icon: Icons.how_to_vote),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          BuildRowDetailsMovie(
                                              text: cubit
                                                  .searchModel!
                                                  .results![index]
                                                  .releaseDate as String,
                                              icon: Icons.date_range),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          BuildRowDetailsMovie(
                                              text: cubit
                                                  .searchModel!
                                                  .results![index]
                                                  .originalLanguage as String,
                                              icon: Icons.language)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            )
                            : Container(),
                      );
                    },
                    condition: cubit.searchModel != null &&
                        cubit.searchModel!.results!.length != 0,
                    fallback: (context) => ConditionalBuilder(
                      condition: searchController.text.isNotEmpty &&
                          cubit.searchModel != null &&
                          cubit.searchModel!.results!.length == 0,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 160.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/search.png'),
                              SizedBox(
                                height: 22,
                              ),
                              Text(
                                'we are sorry, we can\nnot find the movie :(',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Find your movie by Type title,\n'
                                '\t\t\t\t\t\ttcategories, years, etc ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF92929D),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      fallback: (context) => ConditionalBuilder(
                        fallback: (context) => Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: LinearProgressIndicator(
                            color: Color(0xFF3A3F47),
                          ),
                        ),
                        builder: (context) => Container(),
                        condition: searchController.text.isEmpty,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
