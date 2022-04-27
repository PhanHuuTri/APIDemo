import 'package:demoapi/network/network_request.dart';
import 'package:flutter/material.dart';
import '../model/tvshow.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  late Future<TvShow> tvshow;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tvshow = fetchDetailsUrl(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: FutureBuilder<TvShow>(
        future: tvshow,
        builder: (context, datatvshow) {
          if (datatvshow.hasData) {
            return Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * .6,
                  width: size.width,
                  child: Image.network(
                    '${datatvshow.data!.imagePath}',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Positioned(
                    top: 510,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${datatvshow.data!.name}',style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        Row(children: [Text('${datatvshow.data!.network}  | ${datatvshow.data!.startDate}',style: const TextStyle(color: Colors.white)),],),
                        SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                '${datatvshow.data!.description}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (datatvshow.hasError) {
            return const Text('Err');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
