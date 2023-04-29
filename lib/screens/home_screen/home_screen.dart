import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/app/presentation/color_manager.dart';
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
  //controller
  late final HomeScreenGetxController _homeScreenGetxController =
      Get.put(HomeScreenGetxController());

  @override
  void initState() {
    // TODO: implement initState
    _homeScreenGetxController.getMostViewedArticle(
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenGetxController>(
      builder: (controller) => Scaffold(
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
        body: GetBuilder<HomeScreenGetxController>(
          builder: (controller) => controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.mostViewedArticle.length,
                  itemBuilder: (context, index) {
                    return Builder(builder: (context) {
                      Get.put<MostViewed>(controller.mostViewedArticle[index],
                          tag: (controller.mostViewedArticle[index].id)
                              .toString());
                      return ArticleItem(
                        tag: (controller.mostViewedArticle[index].id)
                            .toString(),
                        imageUrl: controller
                                    .mostViewedArticle[index].media!.length ==
                                0
                            ? ''
                            : controller.mostViewedArticle[index].media![0]
                                .media_metadata![0].url!,
                        title: controller.mostViewedArticle[index].title ?? '',
                        date: controller
                                .mostViewedArticle[index].published_date ??
                            '',
                        byline:
                            controller.mostViewedArticle[index].byline ?? '',
                      );
                    });
                  },
                ),
        ),
        drawer: MainDrawer(
            // onOptionSelected: (results1) async {
            //   setState(() {
            //     _homeScreenGetxController.results = results1;
            //     _homeScreenGetxController.getMostViewedArticle(
            //         context: context, type: _homeScreenGetxController.results!);
            //
            //   });
            //
            // },
            ),
      ),
    );
  }
}
