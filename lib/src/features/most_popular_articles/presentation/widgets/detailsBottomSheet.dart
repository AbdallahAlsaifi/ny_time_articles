import 'package:flutter/material.dart';
import 'package:ny_time_articles/src/core/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/sizes.dart';
import '../../../../core/utils/strings.dart';
import '../../domain/entities/article.dart';

class ArticleDetailsBottomSheet extends StatelessWidget {
  final ArticleEntity articleDetails;
  final VoidCallback onClose;

  const ArticleDetailsBottomSheet({
    Key? key,
    required this.articleDetails,
    required this.onClose,
  }) : super(key: key);

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _openLinkButton() {
    return GestureDetector(
      onTap: () => _launchUrl(articleDetails.url),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Strings.viewArticle),
            Icon(Icons.arrow_outward),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: _openLinkButton(),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: onClose,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(Sizes.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleDetails.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: Sizes.defaultSpacingHeight),
                Text(
                  'By ${articleDetails.author}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: Sizes.defaultSpacingHeight),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.event,
                      size: Sizes.smallIconSize,
                      color: Colors.grey,
                    ),
                    Text(
                      articleDetails.datePublished,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
                SizedBox(height: Sizes.defaultSpacingHeight),
                SizedBox(
                  width: Sizes.screenWidth,
                  height: Sizes.detailsImageHeight,
                  child: Image.network(
                    articleDetails.imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
                SizedBox(height: Sizes.defaultSpacingHeight),
                Text(
                  articleDetails.description,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
