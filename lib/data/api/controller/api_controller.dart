import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/api/api_settings.dart';
import 'package:news_app/domain/models/most_viewed.dart';

class ApiController {
  Future<List<MostViewed>> getMostViewedArticle({required String type,required int period}) async {
    var url =
        Uri.parse('${ApiSettings.baseUrl}/$type/$period.json?api-key=${ApiSettings.key}');
    var response = await http.get(url);

    print('=================most viewed');
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == 'OK') {
        return List<MostViewed>.from(
            jsonData['results'].map((x) => MostViewed.fromJson(x)));
      }
    }
    return [];
  }


}
