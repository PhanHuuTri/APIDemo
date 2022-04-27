import 'package:demoapi/model/tvshows.dart';
import 'package:demoapi/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:demoapi/widget/column_item.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({Key?key}):super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{
  List<TvShows>? listTvShows;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  Future<void> getData() async{
    listTvShows = await fetchTvShows(1);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Sreach'),
      ),
      body:ColumnItem(listTvShows),
    );
  }
}