class Articles{

  String? title;
    String? description;
    String? url;
    String? imageNewsUrl;
    late Source source;
    String? publishDate;

   Articles.fromJson(Map<String, dynamic> json)
  {
    title = json['title'].toString() ;
    description = json['description'] ;
    url = json['url'];
    imageNewsUrl = json['urlToImage']?.toString();
    publishDate = json['publishedAt']?.toString();

    source = (json['source'] != null
        ? Source.fromJson(json['source'])
        : null)!;
  }
}

class Source {
  late dynamic id;
  late dynamic  name;

  Source.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}