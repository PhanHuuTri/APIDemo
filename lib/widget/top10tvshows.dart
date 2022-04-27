// ignore_for_file: non_constant_identifier_names

import 'package:demoapi/network/network_request.dart';
import 'package:flutter/material.dart';
import '../model/tvshows.dart';

class TVShowsItem extends StatelessWidget {
  final List<TvShows>? list;
  const TVShowsItem({Key?key,required this.list}):super(key: key);

  @override
  Widget build (BuildContext context) {
    return SizedBox(
      height: 220,
        child: 
            FutureBuilder(
              future: fetchTvShows(1),
              builder:(context,napdata){
                if(napdata.hasData){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list == null
                              ? 0
                              : (list!.length > 10 ? 10 : list!.length),
                      itemBuilder: (context,index)=>_PostItem(list![index]),
                );
                }
                else if (napdata.hasError) {
                      return const Text('Faild');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
              },
               
            ),
    );
  }  

  Widget _PostItem (TvShows post){
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        child: Image.network('${post.imageThumbnailPath}',fit: BoxFit.fill,),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}