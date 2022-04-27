class Episodes {
  int? season;
  int? episode;
  String? name;
  String? airDate;

  Episodes({this.season, this.episode, this.name, this.airDate});

  Episodes.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    episode = json['episode'];
    name = json['name'];
    airDate = json['air_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['episode'] = this.episode;
    data['name'] = this.name;
    data['air_date'] = this.airDate;
    return data;
  }
}