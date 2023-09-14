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
  int ?voteCount;

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