class Article {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  String publishedDate = "";
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  List<String>? desFacet;
  List<Media>? media;
  int? etaId;

  Article(
      {this.uri,
      this.url,
      this.id,
      this.assetId,
      this.source,
      required this.publishedDate,
      this.updated,
      this.section,
      this.subsection,
      this.nytdsection,
      this.adxKeywords,
      this.byline,
      this.type,
      this.title,
      this.abstract,
      this.desFacet,
      this.media,
      this.etaId});

  Article.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    url = json['url'];
    id = json['id'];
    assetId = json['asset_id'];
    source = json['source'];
    publishedDate = json['published_date'] ?? "";
    updated = json['updated'];
    section = json['section'];
    subsection = json['subsection'];
    nytdsection = json['nytdsection'];
    adxKeywords = json['adx_keywords'];
    byline = json['byline'];
    type = json['type'];
    title = json['title'];
    abstract = json['abstract'];
    desFacet = json['des_facet'].cast<String>();
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    etaId = json['eta_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uri'] = uri;
    data['url'] = url;
    data['id'] = id;
    data['asset_id'] = assetId;
    data['source'] = source;
    data['published_date'] = publishedDate;
    data['updated'] = updated;
    data['section'] = section;
    data['subsection'] = subsection;
    data['nytdsection'] = nytdsection;
    data['adx_keywords'] = adxKeywords;
    data['byline'] = byline;
    data['type'] = type;
    data['title'] = title;
    data['abstract'] = abstract;
    data['des_facet'] = desFacet;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    data['eta_id'] = etaId;
    return data;
  }
}

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  Media(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    if (json['media-metadata'] != null) {
      mediaMetadata = <MediaMetadata>[];
      json['media-metadata'].forEach((v) {
        mediaMetadata!.add(MediaMetadata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['copyright'] = copyright;
    data['approved_for_syndication'] = approvedForSyndication;
    if (mediaMetadata != null) {
      data['media-metadata'] = mediaMetadata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['format'] = format;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}
