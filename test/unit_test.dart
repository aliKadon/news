import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/data/api/controller/api_controller.dart';

void main() {
  test('fetch Api', () async {
    bool done = false;
    var fetch = await ApiController().getMostViewedArticle(type: 'viewed', period: 1);
    if(fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}