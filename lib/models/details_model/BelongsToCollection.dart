class BelongsToCollection {

  int ?id;
  String ?name;
  String ?posterPath;
  String ?backdropPath;
  BelongsToCollection.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }



}