import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_interview/class/show_response.dart';
import 'package:http/http.dart' as http;
import 'package:new_interview/class/tv_shows_response.dart';

class ShowProvider extends ChangeNotifier {
  List<ShowsInfos> showsInfo = [];

  ShowProvider() {
    print('TvshowsProvider inicializando');
    getTvShowInfo();
  }

  getTvShowInfo() async {
    final url = Uri.parse('https://api.tvmaze.com/shows/5');

    try {
      await http.get(url).then((response) {
        final decodeData = jsonDecode(response.body);
        print(response.statusCode);
        final shows = ShowsInfos.fromJson(decodeData);
        // showsInfo = shows.;
        print(showsInfo);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }
}
