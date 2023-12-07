import 'package:ny_time_articles/src/features/most_popular_articles/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required int id,
    required String author,
    required String title,
    required String description,
    required String url,
    required String imageUrl,
    required String datePublished,
  }) : super(
          id: id,
          author: author,
          title: title,
          description: description,
          url: url,
          imageUrl: imageUrl,
          datePublished: datePublished,
        );
}
