import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String datePublished;

  const ArticleEntity({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.datePublished,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) {
    return ArticleEntity(
      id: json['id'] as int,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String,
      datePublished: json['datePublished'] as String,
    );
  }

  bool isValid() {
    return id > 0 &&
        author.isNotEmpty &&
        title.isNotEmpty &&
        description.isNotEmpty &&
        url.isNotEmpty;
  }

  @override
  List<Object?> get props =>
      [id, author, title, description, url, imageUrl, datePublished];
}
