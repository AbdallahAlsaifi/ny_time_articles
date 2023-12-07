import 'package:flutter/cupertino.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/data_sources/data_state.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/models/articleModel.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/repositories/articleRepositoryData.dart';
import 'package:test/test.dart';

void main() {
  group('ArticleImplementation', () {
    late ArticleImplementation articleImplementation;
    setUp(() {
      articleImplementation = ArticleImplementation();
    });

    test('Test getArticles - Success', () async {
      debugPrint("#### Starting [ArticleImplementation] 'Success' Scenario ####");
      final DataState<List<ArticleModel>> result = await articleImplementation.getArticles();

      expect(result, isA<DataSuccess<List<ArticleModel>>>());
      expect(result.data!.length, greaterThan(1));
      expect(result.data![0].author, isA<String>());
      debugPrint("#### Ending [ArticleImplementation] 'Success' Scenario ####");
    });

    test('Test getArticles - Failure', () async {
      debugPrint("#### Starting [ArticleImplementation] 'Failure' Scenario ####");
      final DataState<List<ArticleModel>> result = await articleImplementation.getArticles(apiLink: 'https://noApi.com');

      expect(result, isA<DataFailed<List<ArticleModel>>>());
      expect(result.error!.response, isNull);
      debugPrint("#### Ending [ArticleImplementation] 'Failure' Scenario ####");
    });
  });
}
