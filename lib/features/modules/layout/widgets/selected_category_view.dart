import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/features/modules/category_data.dart';
import 'package:news_app/features/modules/layout/widgets/category_view_details.dart';
import 'package:news_app/models/sources_models.dart';

class SelectedCategoryView extends StatefulWidget {
  final CategoryData categoryData;

  const SelectedCategoryView({super.key, required this.categoryData});

  @override
  State<SelectedCategoryView> createState() => _SelectedCategoryViewState();
}

class _SelectedCategoryViewState extends State<SelectedCategoryView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchSourcesList(widget.categoryData.id),
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
        List<Source> sourcesList = snapShot.data ?? [];
        return CategoryViewDetails(sourcesList: sourcesList);
      },
    );
  }
}
