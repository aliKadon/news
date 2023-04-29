import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/app/presentation/color_manager.dart';
import 'package:news_app/app/presentation/font_manager.dart';
import 'package:news_app/app/presentation/values_manager.dart';

import '../../domain/models/most_viewed.dart';

class ArticleDetails extends StatefulWidget {
  final String tag;

  ArticleDetails({required this.tag});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  //controller
  late final MostViewed _mostViewed = Get.find<MostViewed>(tag: widget.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_new_outlined,
                color: ColorManager.black)),
        title: Text('Article'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image.network(
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/ny.png', fit: BoxFit.cover),
                fit: BoxFit.cover,
                _mostViewed.media!.length == 0
                    ? ''
                    : _mostViewed.media![0].media_metadata![1].url!,
              ),
            ),
            SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                '${_mostViewed.source}',
                style: TextStyle(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                '${_mostViewed.title}',
                style: TextStyle(
                    fontSize: FontSize.s16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Type : ',
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.primaryDark,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${_mostViewed.type}',
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    'Section : ',
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.primaryDark,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${_mostViewed.section}',
                    style: TextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${_mostViewed.abstract}',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                    color: ColorManager.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: AppSize.s222,
                    child: Text(
                      '${_mostViewed.byline}',
                      style: TextStyle(
                          color: ColorManager.primaryDark,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.s14),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: AppSize.s110,
                    child: Row(
                      children: [
                        Icon(Icons.date_range, color: ColorManager.primary),
                        Text(
                          '${_mostViewed.published_date}',
                          style: TextStyle(
                              color: ColorManager.primaryDark,
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.s14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _mostViewed.getWebpage(_mostViewed.url!);
                      }, child: Text('View in website'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
