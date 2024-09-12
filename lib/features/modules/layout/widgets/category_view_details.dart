import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/features/modules/layout/widgets/article_detailes.dart';
import 'package:news_app/features/modules/layout/widgets/tab_item_widget.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/sources_models.dart';

class CategoryViewDetails extends StatefulWidget {
  final List<Source> sourcesList;

  const CategoryViewDetails({super.key, required this.sourcesList});

  @override
  State<CategoryViewDetails> createState() => _CategoryViewDetailsState();
}

class _CategoryViewDetailsState extends State<CategoryViewDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(vertical: 10),
                indicator: const BoxDecoration(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                tabs: widget.sourcesList
                    .map((source) => TabItemWidget(
                          source: source,
                          isSelected: selectedIndex ==
                              widget.sourcesList.indexOf(source),
                        ))
                    .toList())),
        // FutureBuilder<List<Artical>>(
        //   future:
        //       ApiManager.fetchArticalList(widget.sourcesList[selectedIndex].id),
        //   builder: (context, snapShot) {
        //     if (snapShot.hasError) {
        //       return const Text("Error Fetching");
        //     }
        //     if (snapShot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: Color(0xff39A552),
        //         ),
        //       );
        //     }
        //     List<Artical> articalesList = snapShot.data ?? [];
        //     return Expanded(
        //         child: ListView.builder(
        //             itemBuilder: (context, index) =>
        //                 Text(articalesList[index].title),
        //                 itemCount: articalesList.length ,));
        //   },
        // )
        FutureBuilder<List<Artical>>(
          future:
              ApiManager.fetchArticalList(widget.sourcesList[selectedIndex].id),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return const Text("Error Fetching");
            }
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff39A552),
                ),
              );
            }

            List<Artical> articalesList = snapShot.data ?? [];
            return Expanded(
              child: ListView.builder(
                  itemCount: articalesList.length,
                  itemBuilder: (context, index) {
                    final article = articalesList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailes(article: article),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: Column(
                            children: [
                              // InkWell(onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           ArticleDetailes(article: article),
                              //     ),
                              //   );
                              // }),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl: article.urlToImage,
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    width: double.infinity,
                                    height: 200, // Adjust height as needed
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xff39A552),
                                      ),
                                    ),
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
                                article.author,
                                style: const TextStyle(
                                    color: Color(0xff79828B), fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) =>
                              //             ArticleDetailes(article: article),
                              //       ),
                              //     );
                              //   },
                              //   child:
                              Text(
                                article.title,
                                style: const TextStyle(
                                    color: Color(0xff42505C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Color(0xff39A552),
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                    // ListTile(
                    // title: Text(articalesList[index].title),
                    // subtitle: Text(articalesList[index].description),
                    // leading: Image.network(articalesList[index].urlToImage),
                    // ),
                  }),
            );
          },
        )
      ],
    );
  }
}
