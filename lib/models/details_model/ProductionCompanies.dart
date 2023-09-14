class ProductionCompanies {

  int ?id;
  String ?logoPath;
  String ?name;
  String ?originCountry;

  ProductionCompanies.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }



}