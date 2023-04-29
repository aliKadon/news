import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/domain/models/media.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../screens/home_screen/controller/home_screen_getx_controller.dart';

class MostViewed extends GetxController {

  String? uri;
  String? url;
  num? id;
  num? asset_id;
  String? source;
  String? published_date;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adx_keywords;
  dynamic column;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  List<String>? des_facet;
  List<String>? org_facet;
  List<String>? per_facet;
  List<String>? geo_facet;
  List<Media>? media;
  num? eta_id;

  MostViewed({
    this.type,
    this.url,
    this.id,
    this.source,
    this.abstract,
    this.adx_keywords,
    this.asset_id,
    this.byline,
    this.column,
    this.des_facet,
    this.eta_id,
    this.geo_facet,
    this.media,
    this.nytdsection,
    this.org_facet,
    this.per_facet,
    this.published_date,
    this.section,
    this.subsection,
    this.title,
    this.updated,
    this.uri,
  });

  factory MostViewed.fromJson(Map<String,dynamic> json) => MostViewed(
    type: json['type'],
    url: json['url'],
    id: json['id'],
    title: json['title'],
    source: json['source'],
    abstract: json['abstract'],
    adx_keywords: json['adx_keywords'],
    asset_id: json['asset_id'],
    byline: json['byline'],
    column: json['column'],
    des_facet: List<String>.from(json['des_facet']),
    eta_id: json['eta_id'],
    geo_facet: List<String>.from(json['geo_facet']),
    media: List<Media>.from(json['media'].map((x) => Media.fromJson(x))),
    nytdsection: json['nytdsection'],
    org_facet: List<String>.from(json['org_facet']),
    per_facet: List<String>.from(json['per_facet']),
    published_date: json['published_date'],
    section: json['section'],
    subsection: json['subsection'],
    updated: json['updated'],
    uri: json['uri'],
  );


  getWebpage(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'an error occurred';
    }
  }
}
