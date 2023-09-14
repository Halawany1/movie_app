import 'BelongsToCollection.dart';
import 'Genres.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

class DetailsModel {
  bool ?adult;
  String ?backdropPath;
  BelongsToCollection ?belongsToCollection;
  int ?budget;
  List<Genres> ?genres;
  String ?homepage;
  int ?id;
  String ?imdbId;
  String ?originalLanguage;
  String ?originalTitle;
  String ?overview;
  dynamic popularity;
  String ?posterPath;
  List<ProductionCompanies> ?productionCompanies;
  List<ProductionCountries> ?productionCountries;
  String ?releaseDate;
  dynamic revenue;
  dynamic runtime;
  List<SpokenLanguages> ?spokenLanguages;
  String ?status;
  String ?tagline;
  String ?title;
  bool ?video;
  dynamic voteAverage;
  int ?voteCount;

  DetailsModel.fromJson(Map<String,dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null ? BelongsToCollection.fromJson(json['belongs_to_collection']) : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }




}