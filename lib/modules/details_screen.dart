import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app/Bloc/layout_cubit/layout_cubit.dart';
import 'package:movie_app/Shared/shared_component/component.dart';

import '../network/end_points.dart';

class DetailsScreen extends StatelessWidget {
  int index;

  DetailsScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = context.read<LayoutCubit>();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  cubit.detailsModel = null;
                  cubit.castModel = null;
                  cubit.reviewModel = null;
                  cubit.index = 0;
                  cubit.GetWatchList();
                  Navigator.pop(context);
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
                child: InkWell(
                  onTap: () {
                    cubit.AddToWatchList(id: cubit.detailsModel!.id!);
                  },
                  child: Icon(
                    Icons.bookmark,
                    size: 30,
                  ),
                ),
              )
            ],
            title: Text(
              'Details',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          body: ConditionalBuilder(
            builder: (context) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    buildStack(cubit),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${cubit.detailsModel!.releaseDate}',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          VerticalDivider(color: Colors.grey, thickness: 1),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.language,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${cubit.detailsModel!.originalLanguage}',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          VerticalDivider(color: Colors.grey, thickness: 1),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${cubit.detailsModel!.genres![0].name}',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Color(0xFFBCBCBC)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildMoving(
                              cubit: cubit, text: 'About Movie', index: 0),
                          SizedBox(
                            width: 10,
                          ),
                          buildMoving(cubit: cubit, text: 'Reviews', index: 1),
                          SizedBox(
                            width: 10,
                          ),
                          buildMoving(cubit: cubit, text: 'Cast', index: 2),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (cubit.index == 0)
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Container(
                              width: 370,
                              child: Text(
                                maxLines: 1000,
                                '${cubit.detailsModel!.overview}',
                                style: GoogleFonts.poppins(
                                    fontSize: 17, color: Colors.white, height: 1.5),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Divider(color: Color(0xFF3A3F47),thickness: 2),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Recommendations',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white
                                ),),


                              ],
                            ),
                            SizedBox(height: 30,),
                            Container(
                              height: 250,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      cubit.recommendationModel!
                                          .results![index]
                                          .posterPath!=null?BuildPoster(
                                        item: true,
                                        poster: cubit.recommendationModel!
                                            .results![index]
                                            .posterPath as String,
                                      ):Container(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: cubit.recommendationModel!
                                      .results!.length),
                            ),
                            Divider(color: Color(0xFF3A3F47),thickness: 2),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Similar Movie',style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white
                                ),),


                              ],
                            ),
                            SizedBox(height: 30,),
                            Container(
                              height: 250,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                  cubit.similarMovieModel!
                                      .results![index]
                                      .posterPath!=null? BuildPoster(
                                        item: true,
                                        poster: cubit.similarMovieModel!
                                            .results![index]
                                            .posterPath as String,
                                      ):Container(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: cubit.similarMovieModel!
                                      .results!.length),
                            ),

                          ],
                        ),
                      )
                    
                    else if (cubit.index == 2)
                      GridView.builder(
                          itemCount: cubit.castModel!.cast!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => cubit
                                      .castModel!.cast![index].profilePath !=
                                  null
                              ? Container(
                                  width: 120,
                                  height: 123,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 123,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image.network(
                                              fit: BoxFit.cover,
                                              '$linkImage${cubit.castModel!.cast![index].profilePath}'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            '${cubit.castModel!.cast![index].name}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  width: 120,
                                  height: 123,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 120,
                                        height: 123,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.asset(
                                                'assets/images/profile.png')),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            '${cubit.castModel!.cast![index].name}',
                                            style: GoogleFonts.poppins(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 1)),
                    if (cubit.index == 1)
                      cubit.reviewModel!.results!.length != 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: cubit
                                                          .reviewModel!
                                                          .results![index]
                                                          .authorDetails!
                                                          .avatarPath !=
                                                      null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.network(
                                                        '$linkImage${cubit.reviewModel!.results![index].authorDetails!.avatarPath}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )
                                                  : Image.asset(
                                                      'assets/images/avatar.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '${cubit.reviewModel!.results![index].authorDetails!.rating ?? 6.1}',
                                              style: GoogleFonts.poppins(
                                                  color: Color(0xFF0296E5)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${cubit.reviewModel!.results![index].author}',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: 313,
                                              child: Text(
                                                '${cubit.reviewModel!.results![0].content}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 20,
                                  ),
                              itemCount: cubit.reviewModel!.results!.length)
                          : Padding(
                              padding: const EdgeInsets.all(88.0),
                              child: Text(
                                'NO Review',
                                style: GoogleFonts.montserrat(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            )
                  ],
                ),
              );
            },
            condition: cubit.detailsModel != null &&
                cubit.castModel != null &&
                cubit.similarMovieModel!=null&&
                cubit.reviewModel != null&&cubit.recommendationModel!=null,
            fallback: (context) => Center(
                child: LoadingAnimationWidget.twistingDots(
                    size: 40,
                    leftDotColor: Color(0xFF0296E5),
                    rightDotColor: Colors.white)),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Container buildStack(LayoutCubit cubit) {
    return Container(
      height: 330,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child:
                Image.network('$linkImage${cubit.detailsModel!.backdropPath}'),
          ),
          Positioned(
            left: 25,
            top: 120,
            child: BuildPoster(
                height: 200,
                item: true,
                poster: cubit.detailsModel!.posterPath),
          ),
          Positioned(
            bottom: 110,
            right: 10,
            child: Container(
              width: 63,
              height: 30,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.65),
                      Color(0xFF252836).withOpacity(0.8)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BuildRowDetailsMovie(
                      vote: false,
                      text: cubit.detailsModel!.voteAverage.toStringAsFixed(1),
                      icon: Icons.star_border_purple500_outlined),
                ],
              ),
            ),
          ),
          Positioned(
            left: 180,
            top: 240,
            child: Container(
              width: 210,
              child: Text(
                maxLines: 2,
                '${cubit.detailsModel!.originalTitle}',
                style: GoogleFonts.poppins(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
