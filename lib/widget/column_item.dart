import 'package:flutter/material.dart';
import 'top10tvshows.dart';
import '../model/tvshows.dart';
import '../widget/mostTvShows.dart';

class ColumnItem extends StatelessWidget{
  final List<TvShows>? list;
  const ColumnItem(this.list,{Key?key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text('Top 10 TV Shows'),
        TVShowsItem(list:list,),
        const Text('Most popular TV Shows'),
        MostTVShowsItem(list: list)
        ],
    );
  }
}