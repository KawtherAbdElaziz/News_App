import 'package:flutter/material.dart';
import 'package:news_app/core/settings_provider.dart';
import 'package:news_app/features/modules/category_data.dart';
import 'package:news_app/features/modules/layout/widgets/category_item_widget.dart';
import 'package:news_app/features/modules/layout/widgets/costom_drawer_widget.dart';
import 'package:news_app/features/modules/layout/widgets/selected_category_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayOut extends StatefulWidget {
  const LayOut({super.key});

  static String routName = "layout";

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  List<CategoryData> categoryList = [
    CategoryData(
        id: "sports",
        name: "Sports",
        icon: "assets/icons/ball.png",
        categoryColor: const Color(0xffC91C22)),
    CategoryData(
        id: "general",
        name: "Politics",
        icon: "assets/icons/Politics.png",
        categoryColor: const Color(0xff003E90)),
    CategoryData(
        id: "health",
        name: "Health",
        icon: "assets/icons/health.png",
        categoryColor: const Color(0xffED1E79)),
    CategoryData(
        id: "business",
        name: "Business",
        icon: "assets/icons/bussines.png",
        categoryColor: const Color(0xffCF7E48)),
    CategoryData(
        id: "environment",
        name: "Environment",
        icon: "assets/icons/environment.png",
        categoryColor: const Color(0xff4882CF)),
    CategoryData(
        id: "science",
        name: "Science",
        icon: "assets/icons/science.png",
        categoryColor: const Color(0xffF2D352)),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              if (selectedCategoryData == null)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                )
            ],
            title: Text(selectedCategoryData == null
                ? "News App"
                : selectedCategoryData!.name),
            backgroundColor: const Color(0xff39A552),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            iconTheme: const IconThemeData(size: 40, color: Colors.white),
          ),
          drawer: CostomDrawerWidget(
            onCategoryChangedClicked: onCategoryChangedClicked,
          ),
          body: selectedCategoryData == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Pick your category \nof interest",
                          style: TextStyle(
                              color: Color(0xff4F5A69),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 30,
                                  childAspectRatio: 0.90),
                          itemBuilder: (context, index) => CategoryItemWidget(
                              categoryData: categoryList[index],
                              onCategoryClicked: onCategoryClicked,
                              index: index),
                          itemCount: categoryList.length,
                        ),
                      )
                    ],
                  ),
                )
              : SelectedCategoryView(categoryData: selectedCategoryData!)),
    );
  }

  CategoryData? selectedCategoryData;

  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }

  void onCategoryChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}
