class Genres {

  int ?id;
  String ?name;
  Genres.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    name = json['name'];
  }



}