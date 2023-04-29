class MediaMetaData {
  String? url;
  String? format;
  num? height;
  num? width;

  MediaMetaData({this.width, this.height, this.format, this.url});

  factory MediaMetaData.fromJson(Map<String,dynamic> json) => MediaMetaData(
    url: json['url'],
    width: json['width'],
    height: json['height'],
    format: json['format'],
  );

}
