import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/domain/entities/export_entities.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});

  final NewsEntity news;

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
              child: news.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        news.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: AspectRatio(
              //     aspectRatio: 1,
              //     child: Image.network(
              //       news.urlToImage,
              //       fit: BoxFit.cover,
              //       loadingBuilder: (context, child, loadingProgress) {
              //         if (loadingProgress == null) return child;
              //         return const Center(child: CircularProgressIndicator());
              //       },
              //     ),
              //   ),
              // ),
            ),
            const SizedBox(height: 6),
            Text(news.title ?? "Новость"),
            const SizedBox(height: 6),
            Text(news.description ?? news.content ?? ""),
          ],
        ),
      ),
    );
  }
}
