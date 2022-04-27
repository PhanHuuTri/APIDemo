class TvShows {
  int? id;
  String? name;
  String? permalink;
  String? startDate;
  String? endDate;
  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;

  TvShows(
      {this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.endDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath});

  TvShows.fromJson( Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    country = json['country'];
    network = json['network'];
    status = json['status'];
    imageThumbnailPath = json['image_thumbnail_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['permalink'] = this.permalink;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['country'] = this.country;
    data['network'] = this.network;
    data['status'] = this.status;
    data['image_thumbnail_path'] = this.imageThumbnailPath;
    return data;
  }
  static List<TvShows> movieSnapshot(List snapshot){
    return snapshot.map((e) {
      return TvShows.fromJson(e);
    }
    ).toList();
  }
}