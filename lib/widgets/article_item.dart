import 'package:flutter/material.dart';
import 'package:news_app/app/presentation/color_manager.dart';
import 'package:news_app/app/presentation/font_manager.dart';
import 'package:news_app/app/presentation/values_manager.dart';
import 'package:news_app/screens/article_details/article_details.dart';

class ArticleItem extends StatefulWidget {
  final String tag;
  final String imageUrl;
  final String title;
  final String byline;
  final String date;

  ArticleItem({
    required this.tag,
    required this.imageUrl,
    required this.byline,
    required this.title,
    required this.date,
  });

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ArticleDetails(tag: widget.tag),));
      },
      child: Container(
        padding: EdgeInsets.all(AppSize.s8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s16),
              child: Image.network(
                fit: BoxFit.cover,
                widget.imageUrl,
                height: AppSize.s60,
                width: AppSize.s60,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/ny.png',
                    height: AppSize.s60,
                    width: AppSize.s60,
                  );
                },
              ),
            ),
            SizedBox(
              width: AppSize.s20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: AppSize.s263,
                  child: Text(
                    '${widget.title}',
                    style: TextStyle(
                        fontSize: FontSize.s12, fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: AppSize.s184,
                      child: Text(
                        '${widget.byline}',
                        style: TextStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.grey),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: ColorManager.greyLight,
                        ),
                        Text(
                          '${widget.date}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: ColorManager.greyLight,
                              fontSize: FontSize.s12),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Expanded(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                ))
          ],
        ),

      ),
    );
  }
}
