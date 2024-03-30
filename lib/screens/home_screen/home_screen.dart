import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/app/presentation/color_manager.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/domain/models/most_viewed.dart';
import 'package:news_app/screens/home_screen/controller/home_screen_getx_controller.dart';
import 'package:news_app/widgets/article_item.dart';
import 'package:news_app/widgets/main_drawer.dart';

class MyHomePage extends StatefulWidget {
  String? type;

  MyHomePage({this.type});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controller GETX
  late final HomeScreenGetxController _homeScreenGetxController =
      Get.put(HomeScreenGetxController());


  @override
  void initState() {
    _homeScreenGetxController.getMostViewedArticle(
      context: context,
    );
    NewsCubit.get(context).getMostViewedArticle(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () async {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.reorder_outlined),
              color: ColorManager.black),
        ),
        title: Text('NY Times Most Popular'),
      ),
      body: BlocBuilder<NewsCubit, States>(
          builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoaded) {
          print("new loaded successfully....");
          // final newsCubit = NewsCubit.get(context);
          List<MostViewed> news = state.news;
          return
            ListView.builder(
            shrinkWrap: true,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Builder(builder: (context) {
                // injection in getx
                Get.put<MostViewed>(news[index],
                    tag: (news[index].id)
                        .toString());
                return ArticleItem(
                  tag: (news[index].id).toString(),
                  imageUrl: news[index].media!.length == 0
                      ? ''
                      : news[index].media![0].media_metadata![0].url!,
                  title: news[index].title ?? '',
                  date: news[index].published_date ?? '',
                  byline: news[index].byline ?? '',
                );
              });
            },
          );
        } else {
          return const Center(child: Text("there something wrong"));
        }
      }),
      drawer: MainDrawer(),
    );
  }
}
