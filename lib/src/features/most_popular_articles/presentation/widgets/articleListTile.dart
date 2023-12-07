import 'package:flutter/material.dart';
import 'package:ny_time_articles/src/core/utils/sizes.dart';

class ArticleListTile extends StatelessWidget {
  final VoidCallback onTapped;
  final String description;
  final String title;
  final String author;
  final String date;
  final String imageUrl;
  final BuildContext context;

  const ArticleListTile({
    Key? key,
    required this.description,
    required this.title,
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.onTapped,
    required this.context,
  }) : super(key: key);

  String _extractFirstTwoWords(String inputString) {
    List<String> words = inputString.split(" ");

    if (words.length > 2) {
      return '${words.take(2).join(" ")}...';
    } else {
      return inputString;
    }
  }

  Widget _buildLeading() {
    return CircleAvatar(
      backgroundColor: imageUrl.isEmpty ? Colors.grey : Colors.transparent,
      backgroundImage: imageUrl.isEmpty ? null : NetworkImage(imageUrl),
      radius: Sizes.avatarRadius,
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(right: Sizes.defaultPadding),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.screenSymmetricPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
          SizedBox(height: Sizes.smallSpacingHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  _extractFirstTwoWords(author),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.event,
                      size: Sizes.smallIconSize,
                      color: Colors.grey,
                    ),
                    Text(date, style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTapped(),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      leading: _buildLeading(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: Sizes.smallIconSize,
      ),
    );
  }
}
