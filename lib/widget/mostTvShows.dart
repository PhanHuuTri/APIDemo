import 'package:demoapi/network/network_request.dart';
import 'package:flutter/material.dart';
import '../model/tvshows.dart';
import '../Screen/detailscreen.dart';

class MostTVShowsItem extends StatelessWidget {
  final List<TvShows>? list;
  const MostTVShowsItem({Key?key,required this.list}):super(key: key);

  @override
  Widget build (BuildContext context){
    return Container(
      height: 400,
      child:FutureBuilder(
                  future: fetchTvShows(1),
                  builder:(context,napdata){
                    if(napdata.hasData){
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: MediaQuery.of(context).size.width/
                            (MediaQuery.of(context).size.height/1.4)
                          ),
                          itemCount: list == null
                                  ? 0
                                  : 10,
                          itemBuilder: (context,index)=>_PostItem(list![index],context),
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

  // ignore: non_constant_identifier_names
  Widget _PostItem(TvShows post,BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(id:post.id!)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
            child: Image.network('${post.imageThumbnailPath}',fit: BoxFit.cover,),
            borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}