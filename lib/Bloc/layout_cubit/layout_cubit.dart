import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/cast_model/cast_model.dart';
import 'package:movie_app/models/details_model/DetailsModel.dart';
import 'package:movie_app/models/popular_model/popular_model.dart';
import 'package:movie_app/models/recommendation_model/recommendation_model.dart';
import 'package:movie_app/models/review_model/review_model.dart';
import 'package:movie_app/models/search_model/SearchModel.dart';
import 'package:movie_app/models/similar_movie_model/similar_movie_model.dart';
import 'package:movie_app/models/top_rated_model/top_rated_model.dart';
import 'package:movie_app/models/upcoming/upcoming_model.dart';
import 'package:movie_app/modules/home_screen.dart';
import 'package:movie_app/modules/search_screen.dart';
import 'package:movie_app/modules/watch_list_screen.dart';
import 'package:movie_app/network/end_points.dart';
import 'package:movie_app/network/remote/remote_helper.dart';

import '../../models/Trending_model/trending_model.dart';
import '../../models/watch_list_model/watch_list_model.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  TrendingMovieModel ?movieModel;

  void GetNowPlaying(){
    emit(LoadingGetNowPlayingMovieState());
    MovieDioHelper.GetData(
        url: nowPlaying
    )
        .then((value) {
      movieModel=TrendingMovieModel.fromJson(value.data);
      print(movieModel!.results![0].backdropPath);
      emit(SuccessGetNowPlayingMovieState(movieModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetNowPlayingMovieState());
    });
  }

  RecommendationModel ?recommendationModel;

  void GetRecommendation(int id){
    emit(LoadingGetRecommendationMovieState());
    MovieDioHelper.GetData(
        url: '$id/recommendations'
    )
        .then((value) {
      recommendationModel=RecommendationModel.fromJson(value.data);
      emit(SuccessGetRecommendationMovieState(recommendationModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetRecommendationMovieState());
    });
  }
  SimilarMovieModel ?similarMovieModel;

  void GetSimilarMovie(int id){
    emit(LoadingGetSimilarMovieState());
    MovieDioHelper.GetData(
        url: '$id/similar'
    )
        .then((value) {
      similarMovieModel=SimilarMovieModel.fromJson(value.data);
      emit(SuccessGetSimilarMovieState(similarMovieModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetSimilarMovieState());
    });
  }



  PopularMovieModel ?popularMovieModel;
  void GetPopular(){
    emit(LoadingGetPopularMovieState());
    MovieDioHelper.GetData(
        url: popular
    )
        .then((value) {
      popularMovieModel=PopularMovieModel.fromJson(value.data);

      emit(SuccessGetPopularMovieState(popularMovieModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetPopularMovieState());
    });
  }

  TopRatedMovieModel ?topRatedMovieModel;
  void GetTopRated(){
    emit(LoadingGetTopRatedMovieState());
    MovieDioHelper.GetData(
        url: topRated
    )
        .then((value) {
      topRatedMovieModel=TopRatedMovieModel.fromJson(value.data);

      emit(SuccessGetTopRatedMovieState(topRatedMovieModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetTopRatedMovieState());
    });
  }


  UpcomingMovieModel ?upcomingMovieModel;
  void GetUpcoming(){
    emit(LoadingGetUpcomingMovieState());
    MovieDioHelper.GetData(
        url: upcoming
    )
        .then((value) {
      upcomingMovieModel=UpcomingMovieModel.fromJson(value.data);

      emit(SuccessGetUpcomingMovieState(upcomingMovieModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetUpcomingMovieState());
    });
  }


  int index=0;

  void ChangeIndex(int i){
    index=i;
    emit(ChangeIndexState());
  }

  int indexNavbar=0;
  void ChangeIndexNavBar(int i){
    indexNavbar=i;
    emit(ChangeIndexNavBarState());
  }
  List<Widget> screens=[
    HomeScreen(),
    SearchScreen(),
    WatchListScreen()
  ];

  SearchModel ?searchModel;
  void GetSearchMovie(String text){
    emit(LoadingGetSearchMovieState());
    SearchDioHelper.GetData(
        url: movie,
      query: {
          'query':text,
        'language':'en-US',
        'page':1
      }
    )
        .then((value) {

      searchModel=SearchModel.fromJson(value.data);

      emit(SuccessGetSearchMovieState(searchModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetSearchMovieState());
    });
  }

  DetailsModel ?detailsModel;
  void GetDetailsMovie(int id){
    emit(LoadingGetDetailsMovieState());
    MovieDioHelper.GetData(
      url: id.toString(),

    )
        .then((value) {
      detailsModel=DetailsModel.fromJson(value.data);
      emit(SuccessGetDetailsMovieState(detailsModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetDetailsMovieState());
    });
  }

  CastModel ?castModel;
  void GetCast(int id){
    emit(LoadingGetCastState());
    MovieDioHelper.GetData(
        url: (id.toString()+credits).toString(),

    )
        .then((value) {
      castModel=CastModel.fromJson(value.data);
      emit(SuccessGetCastState(castModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetCastState());
    });
  }

  ReviewModel ?reviewModel;
  void GetReview(int id){
    emit(LoadingGetReviewState());
    MovieDioHelper.GetData(
        url: (id.toString()+reviews).toString(),
        query: {
          'language':'en-US',
          'page':1
        }
    )
        .then((value) {
      reviewModel=ReviewModel.fromJson(value.data);
      emit(SuccessGetReviewState(reviewModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetReviewState());
    });
  }

  void AddToWatchList({required int id}){
    emit(LoadingAddWatchListState());
    WatchListDioHelper.PostData(
        url: '1153/watchlist',
      data:  {
        "media_type": "movie",
        "media_id": id,
        "watchlist": true
      }
    )
        .then((value) {
      emit(SuccessAddWatchListState());
    }).catchError((error){
      print(error.toString());
      emit(FailedAddWatchListState());
    });
  }

  void GetWatchList(){
    emit(LoadingGetWatchListState());
    WatchListDioHelper.GetData(
        url: '123/watchlist/movies',

    )
        .then((value) {
          watchListModel=WatchListModel.fromJson(value.data);

      emit(SuccessGetWatchListState(watchListModel!));
    }).catchError((error){
      print(error.toString());
      emit(FailedGetWatchListState());
    });
  }
  WatchListModel ?watchListModel;


  bool visability=false;
  void ChangevisiableIcon(){
    visability=!visability;
    emit(ChangeVisibleIconState());
  }

}
