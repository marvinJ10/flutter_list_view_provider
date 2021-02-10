import 'package:flutter_list_view_provider/store.dart';
import 'package:http/http.dart';

import '../models/soccer_match.dart';

class SoccerApi {
  final String apiUrl =
      // "https://api-football-v1.p.rapidapi.com/fixtures?season=2020&league=39";
      // "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
      "https://v3.football.api-sports.io/fixtures?season=2021&league=39";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "a29181beffmsh73b2db3ece9373cp1adb87jsn11e774e0d5c2"
  };

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;

    List<dynamic> matchesList = responseData;
    List<SoccerMatch> matches =
        matchesList.map((dynamic item) => SoccerMatch.fromJson(item)).toList();
    return matches;
    // if (res.statusCode == 200) {
    //   // this mean that we are connected to the database
    //   body = jsonDecode(res.body);
    //   List<dynamic> matchesList = body['response'];
    //   print("Api service: ${body}"); // to debug
    //   List<SoccerMatch> matches = matchesList
    //       .map((dynamic item) => SoccerMatch.fromJson(item))
    //       .toList();
    //
    //   return matches;
    // }
  }
}
