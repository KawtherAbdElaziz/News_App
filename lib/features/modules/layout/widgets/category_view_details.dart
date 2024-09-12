import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_manager.dart';
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
                itemBuilder: (context, index) => ListTile(
                  title: Text(articalesList[index].title),
                  // subtitle: Text(articalesList[index].description),
                  // leading: Image.network(articalesList[index].urlToImage),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

//  /v2/top-headlines
