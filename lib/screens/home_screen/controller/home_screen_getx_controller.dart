import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/presentation/color_manager.dart';
import 'package:news_app/data/api/controller/api_controller.dart';

import '../../../domain/models/most_viewed.dart';

class HomeScreenGetxController extends GetxController {
  List<MostViewed> mostViewedArticle = [];
  var isLoading = true;

  var results;

  late final ApiController _apiController = ApiController();

  void getMostViewedArticle(
      {required BuildContext context,String type = 'mostviewed/all-sections' , int period = 1}) async {
    try {
      mostViewedArticle =
          await _apiController.getMostViewedArticle(period: period,type: type);
      isLoading = false;
      update();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: ColorManager.red,
      ));
    }
  }


  void reload({required String results1}) {
    results = results1;
  }
}
