class ApodData {
  final String title; // 圖片標題
  final String url; // 圖片資源連結
  final String hdurl; // 高清圖片資源連結
  final String explanation; // 圖片描述
  final String mediaType; // 圖片類型
  final String date; // 日期
  final String serviceVersion; // 版本

  // ApodData({
  //   required this.title,
  //   required this.url,
  //   required this.hdurl,
  //   required this.explanation,
  //   required this.mediaType,
  //   required this.date,
  //   required this.serviceVersion
  // });

  ApodData(this.title, this.url, this.hdurl, this.explanation, this.mediaType, this.date, this.serviceVersion);

  // factory ApodData.fromJson(Map<String, dynamic> json) {
  //   return ApodData(
  //     title: json['title'],
  //     mediaType: json['media_type'],
  //     url: json['url'],
  //     hdurl: json['hdurl'],
  //     explanation: json['explanation'],
  //     date: json['date'],
  //     serviceVersion: json['service_version']
  //   );
  // }

  ApodData.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      url = json['url'],
      hdurl = json['hdurl'],
      explanation = json['explanation'],
      mediaType = json['media_type'],
      date = json['date'],
      serviceVersion = json['service_version'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
    'hdurl': hdurl,
    'explanation': explanation,
    'media_type': mediaType,
    'date': date,
  };
}
