import 'tvshows.dart';
class Post {
  String? total;
  int? page;
  int? pages;
  List<TvShows>? tvShows;

  Post({this.total, this.page, this.pages, this.tvShows});

  Post.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
    if (json['tv_shows'] != null) {
      tvShows = <TvShows>[];
      json['tv_shows'].forEach((v) {
        tvShows!.add(new TvShows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['pages'] = this.pages;
    if (this.tvShows != null) {
      data['tv_shows'] = this.tvShows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


