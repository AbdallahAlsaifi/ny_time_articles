import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/manager/articles/articles_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton<ArticlesBloc>(() => ArticlesBloc());
}
