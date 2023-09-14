import 'Results.dart';

class SearchModel {
  int ?page;
  List<Results> ?results;
  int ?totalPages;
  int ?totalResults;

  SearchModel.fromJson(Map<String,dynamic> json) {
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