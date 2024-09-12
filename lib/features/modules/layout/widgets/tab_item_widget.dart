import 'package:flutter/material.dart';
import 'package:news_app/models/sources_models.dart';

class TabItemWidget extends StatefulWidget {
  final Source source;
  final bool isSelected;

  const TabItemWidget(
      {super.key, required this.source, required this.isSelected});

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
          color: widget.isSelected
              ? const Color(0xff39A552)
              : const Color(0xffffffff),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xff39A552),
          )),
      child: Text(
        widget.source.name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: widget.isSelected
              ? const Color(0xffffffff)
              : const Color(0xff39A552),
        ),
      ),
    );
  }
}
