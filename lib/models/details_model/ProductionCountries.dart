class ProductionCountries {
  String ?iso31661;
  String ?name;


  ProductionCountries.fromJson(Map<String,dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }



}