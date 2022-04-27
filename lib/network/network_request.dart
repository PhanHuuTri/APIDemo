import 'dart:convert';
import 'dart:convert' as convert;
import 'package:demoapi/model/post.dart';
import 'package:demoapi/model/tvshow.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:demoapi/model/tvshows.dart';

const baseUrl = 'https://www.episodate.com/';
final locationUrl =(page)=>'${baseUrl}/api/most-popular?page=${page}';
final popularUrl=(locationId,page)=>'${baseUrl}/api/search?q=${locationId}&page=${page}';
final detailsUrl=(show)=>'${baseUrl}/api/show-details?q=${show}';

class Networkrequest {
  static const String apiEndpoint =
      'https://jsonplaceholder.typicode.com/posts';
  static Uri url = Uri.parse(apiEndpoint);
  static List<Post> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson((model))).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 400) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}
Future<List<TvShows>> fetchTvShows(int page) async{
  final response = await http.get(Uri.parse( locationUrl(page)));
  Map data =  jsonDecode(response.body);
  List _tvshows=[];
  for(var item in data['tv_shows']){
    _tvshows.add(item);
  }
  return TvShows.movieSnapshot(_tvshows);
}

Future<TvShow> fetchDetailsUrl(int id)async{

    final response = await http.get(Uri.parse(detailsUrl(id)));
    final convertdata = convert.jsonDecode(response.body);
    final data = convertdata["tvShow"];
    return TvShow.fromJson(data);
}
