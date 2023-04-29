import 'package:news_app/domain/models/media_metadata.dart';

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  num? approved_for_syndication;
  List<MediaMetaData>? media_metadata;

  Media(
      {this.type,
      this.approved_for_syndication,
      this.caption,
      this.copyright,
      this.media_metadata,
      this.subtype});

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json['type'],
        approved_for_syndication: json['approved_for_syndication'],
        caption: json['caption'],
        copyright: json['copyright'],
        media_metadata: List<MediaMetaData>.from(
            json['media-metadata'].map((x) => MediaMetaData.fromJson(x))),
        subtype: json['subtype'],
      );
}
