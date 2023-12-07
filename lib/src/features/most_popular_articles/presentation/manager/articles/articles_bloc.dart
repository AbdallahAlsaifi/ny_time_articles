import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/data_sources/data_state.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/data/repositories/articleRepositoryData.dart';
import 'articles_event.dart';
import 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(const ArticlesLoading()) {
    on<GetArticles>(onGetArticles);
    on<RefreshArticles>(onRefreshArticles);
  }

  void onGetArticles(GetArticles event, Emitter<ArticlesState> emit) async {
    final dataState = await ArticleImplementation().getArticles();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticlesReceived(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ArticlesError(dataState.error!));
    }
  }

  void onRefreshArticles(
      RefreshArticles event, Emitter<ArticlesState> emit) async {
    emit(const ArticlesLoading());

    final dataState = await ArticleImplementation().getArticles();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticlesReceived(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ArticlesError(dataState.error!));
    }
  }
}
