import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_time_articles/src/config/themes/appTheme.dart';
import 'package:ny_time_articles/src/core/di.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/manager/articles/articles_bloc.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/manager/articles/articles_event.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/pages/homeScreen.dart';

class NYMostPopularApp extends StatelessWidget {
  const NYMostPopularApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: appTheme(),
        home: const SafeArea(child: MostPopularHomeScreen()),
      ),
    );
  }
}
