import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';

import '../Shared/shared_component/component.dart';
import 'details_screen.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(
      builder: (context, state) {
        var cubit=context.read<LayoutCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.ChangeIndexNavBar(1);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              'Watch list',
              style: GoogleFonts.montserrat(fontSize: 20),
            ),
          ),
          body: SafeArea(
            child: ConditionalBuilder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.watchListModel!.results!.length,
                    itemBuilder: (context, index) => cubit
                        .watchListModel!.results![index].posterPath !=
                        null
                        ? InkWell(
                      onTap: () {
                        cubit.GetCast(cubit
                            .watchListModel!.results![index].id as int);
                        cubit.GetDetailsMovie(cubit
                            .watchListModel!.results![index].id as int);
                        cubit.GetReview(
                            cubit.watchListModel!.results![index].id as int);
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
                              poster: cubit.watchListModel!.results![index]
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
                                  '${cubit.watchListModel!.results![index].originalTitle}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                BuildRowDetailsMovie(
                                    text: cubit.watchListModel!
                                        .results![index].voteAverage
                                        .toStringAsFixed(1),
                                    vote: false,
                                    icon: Icons
                                        .star_border_purple500_outlined),
                                SizedBox(
                                  height: 10,
                                ),
                                BuildRowDetailsMovie(
                                    text: cubit.watchListModel!
                                        .results![index].popularity,
                                    icon: Icons.how_to_vote),
                                SizedBox(
                                  height: 10,
                                ),
                                BuildRowDetailsMovie(
                                    text: cubit
                                        .watchListModel!
                                        .results![index]
                                        .releaseDate as String,
                                    icon: Icons.date_range),
                                SizedBox(
                                  height: 10,
                                ),
                                BuildRowDetailsMovie(
                                    text: cubit
                                        .watchListModel!
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
                  ),
                );
              },
              condition: cubit.watchListModel != null &&
                  cubit.watchListModel!.results!.length != 0,
              fallback: (context) => Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/watchlist.png',width: 100,height: 100,),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        'There is no movie yet!',
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Find your movie by Type title,\n\t\t\t\t\t\t\t\t\tcategories, years, etc',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF92929D),
                        ),
                      )
                    ],
                  ),
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
}
