import 'package:dio/dio.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/data_sources/data_state.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/data_sources/apiController.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/models/articleModel.dart';

class ArticleImplementation {
  Future<DataState<List<ArticleModel>>> getArticles(
      {String apiLink = ''}) async {
    try {
      final response = await ApiController().getData(apiLink: apiLink);

      if (response.statusCode == 200) {
        List<ArticleModel> finalResult =
            getFinalResult(response.data['results']);
        return DataSuccess(finalResult);
      } else {
        return DataFailed(
          DioException(
            requestOptions: RequestOptions(),
            error: response.statusMessage,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  List<ArticleModel> getFinalResult(dynamic results) {
    if (results is! List) {
      throw Exception("Unexpected format for results");
    }

    return results.map<ArticleModel>(_createArticleModel).toList();
  }

  ArticleModel _createArticleModel(dynamic e) {
    String imageUrl = '';

    if (e.containsKey('media') &&
        e['media'] is List &&
        e['media'].isNotEmpty &&
        e['media'][0].containsKey('media-metadata') &&
        e['media'][0]['media-metadata'] is List &&
        e['media'][0]['media-metadata'].isNotEmpty) {
      imageUrl = e['media'][0]['media-metadata'].last['url'];
    }

    return ArticleModel(
      author: e['byline']?.toString().replaceFirst('By ', '') ?? '',
      title: e['title'] ?? '',
      datePublished: e['published_date'] ?? '',
      description: e['abstract'] ?? '',
      id: e['id'] ?? '',
      imageUrl: imageUrl,
      url: e['url'] ?? '',
    );
  }
}
