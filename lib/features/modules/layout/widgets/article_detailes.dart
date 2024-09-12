import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:news_app/models/articles_model.dart';

class ArticleDetailes extends StatefulWidget {
  final Artical article;

  const ArticleDetailes({super.key, required this.article});

  @override
  State<ArticleDetailes> createState() => _ArticleDetailesState();
}

class _ArticleDetailesState extends State<ArticleDetailes> {
  @override
  Widget build(BuildContext context) {
    DateTime publishedDate = DateTime.parse(widget.article.publishedAt);
    String relativeTime = timeago.format(publishedDate);
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 67,
          backgroundColor: const Color(0xff39A552),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
          iconTheme: const IconThemeData(size: 30, color: Colors.white),
          title: const Text("News"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.article.urlToImage,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200, // Adjust height as needed
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.article.author,
                  style:
                      const TextStyle(color: Color(0xff79828B), fontSize: 13),
                ),
                const SizedBox(height: 16.0),
                Text(
                  widget.article.title,
                ),
                const SizedBox(height: 16.0),
                Text(
                  relativeTime, // Display relative time here
                  style:
                      const TextStyle(color: Color(0xff79828B), fontSize: 13),
                ),
                const SizedBox(height: 16.0),
                Text(
                  widget.article.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
