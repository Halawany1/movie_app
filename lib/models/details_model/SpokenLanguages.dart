class SpokenLanguages {
  String ?englishName;
  String ?iso6391;
  String ?name;

  SpokenLanguages.fromJson(Map<String,dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }




}