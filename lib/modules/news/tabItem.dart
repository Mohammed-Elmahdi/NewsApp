import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/styles/my_theme.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem(this.sources,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: isSelected ? MyThemeData.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Text('${sources.name}',
      style: TextStyle(
        color: isSelected?Colors.white:MyThemeData.primaryColor
      ),
      ),
    );
  }
}
