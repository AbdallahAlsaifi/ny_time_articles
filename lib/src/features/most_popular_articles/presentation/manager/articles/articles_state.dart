import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article.dart';

abstract class ArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const ArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles ?? [], error];
}

class ArticlesLoading extends ArticlesState {
  const ArticlesLoading();
}

class ArticlesReceived extends ArticlesState {
  const ArticlesReceived(List<ArticleEntity> articles)
      : super(articles: articles);
}

class ArticlesError extends ArticlesState {
  const ArticlesError(DioException? error) : super(error: error);
}
