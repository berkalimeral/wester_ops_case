class NasaModell {
  String? copyright;
  String? date;
  String? explanation;
  String? hdurl;
  String? mediaType;
  String? serviceVersion;
  String? title;
  String? url;

  NasaModell(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.mediaType,
      this.serviceVersion,
      this.title,
      this.url});

  factory NasaModell.fromJson(Map<String, dynamic> json) => NasaModell(
        copyright: json['copyright'] as String?,
        date: json['date'] as String?,
        explanation: json['explanation'] as String?,
        hdurl: json['hdurl'] as String?,
        mediaType: json['media_type'] as String?,
        serviceVersion: json['service_version'] as String?,
        title: json['title'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'copyright': copyright,
        'date': date,
        'explanation': explanation,
        'hdurl': hdurl,
        'media_type': mediaType,
        'service_version': serviceVersion,
        'title': title,
        'url': url,
      };
}
