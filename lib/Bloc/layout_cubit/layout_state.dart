part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class LoadingGetNowPlayingMovieState extends LayoutState {}

class SuccessGetNowPlayingMovieState extends LayoutState {
  final TrendingMovieModel movieModel;

  SuccessGetNowPlayingMovieState(this.movieModel);

}
class FailedGetNowPlayingMovieState extends LayoutState {}
class ChangeIndexState extends LayoutState {}
class ChangeIndexNavBarState extends LayoutState {}
class LoadingGetPopularMovieState extends LayoutState {}

class SuccessGetPopularMovieState extends LayoutState {
  final PopularMovieModel popularMovieModel;

  SuccessGetPopularMovieState(this.popularMovieModel);

}
class FailedGetPopularMovieState extends LayoutState {}


class LoadingGetTopRatedMovieState extends LayoutState {}

class SuccessGetTopRatedMovieState extends LayoutState {
  final TopRatedMovieModel topRatedMovieModel;

  SuccessGetTopRatedMovieState(this.topRatedMovieModel);

}
class FailedGetTopRatedMovieState extends LayoutState {}


class LoadingGetUpcomingMovieState extends LayoutState {}

class SuccessGetUpcomingMovieState extends LayoutState {
  final UpcomingMovieModel topRatedMovieModel;

  SuccessGetUpcomingMovieState(this.topRatedMovieModel);

}
class FailedGetUpcomingMovieState extends LayoutState {}


class LoadingGetSearchMovieState extends LayoutState {}

class SuccessGetSearchMovieState extends LayoutState {
  final SearchModel searchModel;

  SuccessGetSearchMovieState(this.searchModel);

}
class FailedGetSearchMovieState extends LayoutState {}


class LoadingGetDetailsMovieState extends LayoutState {}

class SuccessGetDetailsMovieState extends LayoutState {
  final DetailsModel detailsModel;

  SuccessGetDetailsMovieState(this.detailsModel);

}
class FailedGetDetailsMovieState extends LayoutState {}

class LoadingGetRecommendationMovieState extends LayoutState {}

class SuccessGetRecommendationMovieState extends LayoutState {
  final RecommendationModel recommendationModel;

  SuccessGetRecommendationMovieState(this.recommendationModel);

}
class FailedGetRecommendationMovieState extends LayoutState {}

class LoadingGetSimilarMovieState extends LayoutState {}

class SuccessGetSimilarMovieState extends LayoutState {
  final SimilarMovieModel similarMovieModel;

  SuccessGetSimilarMovieState(this.similarMovieModel);

}
class FailedGetSimilarMovieState extends LayoutState {}


class LoadingGetCastState extends LayoutState {}

class SuccessGetCastState extends LayoutState {
  final CastModel castModel;

  SuccessGetCastState(this.castModel);

}
class FailedGetCastState extends LayoutState {}

class LoadingGetReviewState extends LayoutState {}

class SuccessGetReviewState extends LayoutState {
  final ReviewModel reviewModel;

  SuccessGetReviewState(this.reviewModel);

}
class FailedGetReviewState extends LayoutState {}

class ChangeVisibleIconState extends LayoutState {}

class ChangeWatchListIconState extends LayoutState {}
class LoadingAddWatchListState extends LayoutState {}

class SuccessAddWatchListState extends LayoutState {

}
class FailedAddWatchListState extends LayoutState {}




class LoadingGetWatchListState extends LayoutState {}

class SuccessGetWatchListState extends LayoutState {
  final WatchListModel watchListModel;

  SuccessGetWatchListState(this.watchListModel);
}
class FailedGetWatchListState extends LayoutState {}