import 'package:flutter/material.dart';
import 'package:mediaprobe/models/article.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article, required this.onTap});

  final Article article;
  final Function(Article) onTap;

  String get url {
    try {
      return article.media?.first.mediaMetadata?[2].url ?? "";
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () => onTap(article),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            url.isEmpty
                ? const SizedBox(height: 150)
                : Image.network(
                    url,
                    fit: BoxFit.cover,
                    height: 150.0,
                    width: double.infinity,
                  ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    article.abstract ?? "",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Published Date: ${article.publishedDate}',
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
