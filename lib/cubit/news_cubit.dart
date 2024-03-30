import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/domain/models/most_viewed.dart';

import '../app/presentation/color_manager.dart';
import '../data/api/controller/api_controller.dart';

class NewsCubit extends Cubit<States> {
  NewsCubit() : super(NewsLoadingState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<MostViewed> mostViewedArticle = [];
  late final ApiController _apiController = ApiController();


  void getMostViewedArticle(
      {required BuildContext context,String type = 'mostviewed/all-sections' , int period = 1}) async {
    emit(NewsLoadingState());
    try {
      mostViewedArticle =
      await _apiController.getMostViewedArticle(period: period,type: type);
      // print("new loaded successfully....");
      emit(NewsLoaded(mostViewedArticle));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: ColorManager.red,
      ));
    }
  }
}
