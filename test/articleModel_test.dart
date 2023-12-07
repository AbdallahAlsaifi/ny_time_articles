import 'package:flutter/cupertino.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/models/articleModel.dart';
import 'package:test/test.dart';

void main() {
  group('ArticleModel', () {
    late ArticleModel article;

    setUp(() {
      article = ArticleModel(
        id: 10203040,
        author: 'John Doe',
        title: 'Title',
        description: 'Description',
        url: 'https://example.com/article',
        imageUrl: 'https://example.com/image.jpg',
        datePublished: '2023-1-1',
      );
    });

    test('Test ArticleModel', () {
      debugPrint("#### Starting [ArticleModel] 'Success' Scenario ####");
      expect(article.id, equals(10203040));
      expect(article.author, equals('John Doe'));
      expect(article.title, equals('Title'));
      expect(article.description, equals('Description'));
      expect(article.url, equals('https://example.com/article'));
      expect(article.imageUrl, equals('https://example.com/image.jpg'));
      expect(article.datePublished, equals('2023-1-1'));

      expect(article.datePublished, isA<String>());
      expect(article.id, isA<int>());
      debugPrint("#### Ending [ArticleModel] 'Success' Scenario ####");
    });


  });
}