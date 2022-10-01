import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_interview/class/show_response.dart';
import 'package:new_interview/services/show_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var resp;

  getTvShowInfo() async {
    final url = Uri.parse('https://api.tvmaze.com/shows/5');

    try {
      await http.get(url).then((response) {
        resp = jsonDecode(response.body);
        print(resp);
        setState(() {});
        // print(response.statusCode);
        // final shows = ShowInfo.fromJson(decodeData);
        // showsinfo = shows;
      });
    } catch (e) {
      print(e);
    }
  }

  ShowInfo? showsinfo;
  @override
  void initState() {
    // final tvShowProvider = Provider.of<ShowProvider>(context, listen: false);
    // Future.delayed(
    //     Duration.zero, () async => await tvShowProvider.getTvShowInfo());

    // showsinfo = tvShowProvider.showsinfo;
    getTvShowInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tvShowProvider = Provider.of<ShowProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tv Show'),
      ),
      body: Center(
        child: resp == null
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : Center(
                child: Container(
                  width: 300,
                  height: 500,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: NetworkImage(resp['image']['medium']),
                          fit: BoxFit.cover,
                        ),
                      )),
                      Text(resp['name'],
                          style: Theme.of(context).textTheme.headline3,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      Text(resp['genres'].toString(),
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      Text(resp['rating']['average'].toString(),
                          style: Theme.of(context).textTheme.subtitle2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      Text(resp['status'],
                          style: Theme.of(context).textTheme.subtitle2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      Text(resp['premiered'],
                          style: Theme.of(context).textTheme.subtitle2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}



// // class _TvShowsInformation extends StatelessWidget {
// //   final ShowInfo shows;
// //   const _TvShowsInformation({
// //     Key? key,
// //     required this.shows,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     if (this.shows == 0) {
// //       return Container(
// //         width: double.infinity,
// //         height: 500,
// //         child: Center(
// //             child: Container(
// //           color: Colors.amber,
// //           width: 200,
// //         )),
// //       );
// //     }
// //     return Container(
// //       width: double.infinity,
// //       // color: Colors.amber,
// //       height: 500,
// //       child: ListView.builder(
// //         scrollDirection: Axis.horizontal,
// //         itemCount: shows.length,
// //         itemBuilder: (_, int index) {
// //           final show = shows[index];
// //           return Container(
// //               width: 200,
// //               height: double.infinity,
// //               // color: Colors.purple,
// //               margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
// //               child: Column(
// //                 children: [
// //                   ClipRRect(
// //                     borderRadius: BorderRadius.circular(20),
// //                     child: FadeInImage(
// //                       placeholder: AssetImage('assets/jar-loading.gif'),
// //                       image: NetworkImage(show.image.medium),
// //                       height: 350,
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                   SizedBox(height: 5),
// //                   Text(
// //                     show.name,
// //                     style: Theme.of(context).textTheme.headline6,
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 2,
// //                   ),
// //                   Text(
// //                     show.language,
// //                     style: Theme.of(context).textTheme.subtitle1,
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 2,
// //                   ),
// //                   Text(
// //                     show.genres.toString(),
// //                     style: Theme.of(context).textTheme.subtitle1,
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 2,
// //                   ),
// //                   Text(
// //                     show.status,
// //                     style: Theme.of(context).textTheme.subtitle2,
// //                     overflow: TextOverflow.ellipsis,
// //                     maxLines: 2,
// //                   ),
// //                 ],
// //               ));
// //         },
// //       ),
// //     );
// //   }
// // }
