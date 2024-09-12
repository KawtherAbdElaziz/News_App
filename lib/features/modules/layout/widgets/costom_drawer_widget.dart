import 'package:flutter/material.dart';

class CostomDrawerWidget extends StatelessWidget {
  final void Function() onCategoryChangedClicked;

  const CostomDrawerWidget({super.key, required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context);
    return Container(
      width: mediaQuary.size.width * 0.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: mediaQuary.size.height * 0.2,
            color: const Color(0xff39A552),
            child: const Text(
              "News App!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              onCategoryChangedClicked();
            },
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
