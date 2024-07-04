import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news/domain/entities/export_entities.dart';
import 'package:news/domain/repositories/export_repositories.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  final _newsRepo = GetIt.instance<NewsRepository>();
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    _checkIsLiked(widget.news.url);
  }

  void _onLikePressed(String? url) {
    if (url == null) return;

    isLiked ? _newsRepo.unlikeNews(url: url) : _newsRepo.likeNews(url: url);
    setState(() => isLiked = !isLiked);
  }

  void _checkIsLiked(String? url) async {
    if (url == null) {
      isLiked = false;
      return;
    }

    isLiked = await _newsRepo.isNewsLiked(url: url);
    setState(() {
      isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: screenWidth,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/no_image.png"),
                ),
              ),
              child: widget.news.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.news.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 6),
            Text(widget.news.title ?? "Новость"),
            const SizedBox(height: 6),
            Text(widget.news.description ?? widget.news.content ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => _onLikePressed(widget.news.url),
                  icon: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : null,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
