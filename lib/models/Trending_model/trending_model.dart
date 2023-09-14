
class TrendingMovieModel {
  Dates ?dates;
  int ?page;
  List<Results> ?results;
  dynamic totalPages;
  dynamic totalResults;


  TrendingMovieModel.fromJson(Map<String,dynamic> json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

class Dates {
  String ?maximum;
  String ?minimum;


  Dates.fromJson(Map<String,dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }



}

class Results {
  bool ?adult;
  String ?backdropPath;
  List<int> ?genreIds;
  int ?id;
  String ?originalLanguage;
  String ?originalTitle;
  String ?overview;
  dynamic popularity;
  String ?posterPath;
  String ?releaseDate;
  String ?title;
  bool ?video;
  dynamic voteAverage;
  dynamic voteCount;

  Results.fromJson(Map<String,dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }


}