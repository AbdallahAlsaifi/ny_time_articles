
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/manager/articles/articles_bloc.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/manager/articles/articles_event.dart';
import 'package:ny_time_articles/src/features/most_popular_articles/presentation/widgets/articleListTile.dart';
import '../../../../core/di.dart';
import '../../../../core/utils/sizes.dart';
import '../../../../core/utils/strings.dart';
import '../../domain/entities/article.dart';
import '../manager/articles/articles_state.dart';
import '../widgets/detailsBottomSheet.dart';

class MostPopularHomeScreen extends StatelessWidget {
  const MostPopularHomeScreen({Key? key});

  void _showArticleDetailsBottomSheet(
      BuildContext context, ArticleEntity articleDetails) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ArticleDetailsBottomSheet(
          articleDetails: articleDetails,
          onClose: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        final ArticlesBloc articlesBloc = sl<ArticlesBloc>();
        articlesBloc.add(const RefreshArticles());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appTitle),
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.more_vert_rounded),
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.screenSymmetricPadding),
          child: _buildContent(state),
        );
      },
    );
  }

  Widget _buildContent(ArticlesState state) {
    if (state is ArticlesLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ArticlesReceived) {
      return _buildArticlesList(state.articles!);
    } else {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(Sizes.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: Sizes.soloCenteredIconSize,
                color: Colors.red,
              ),
              Text(state.error!.message.toString()),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final data = articles[index];
        return ArticleListTile(
          onTapped: () => _showArticleDetailsBottomSheet(context, data),
          description: data.description,
          title: data.title,
          author: data.author,
          date: data.datePublished,
          imageUrl: data.imageUrl,
          context: context,
        );
      },
    );
  }
}
