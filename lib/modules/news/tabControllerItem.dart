import 'package:flutter/material.dart';
import 'package:news_app/modules/news/newsData.dart';
import 'package:news_app/modules/news/tabItem.dart';

import '../../models/SourcesResponse.dart';

class TabControllerItem extends StatefulWidget {
  List<Sources>sources;
  TabControllerItem(this.sources);

  @override
  State<TabControllerItem> createState() => _TabControllerItemState();
}

class _TabControllerItemState extends State<TabControllerItem> {
  int isSelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Image.asset('assets/images/pattern.png',fit: BoxFit.cover,height: double.infinity),
          Column(
          children: [
            DefaultTabController(
                length: widget.sources.length,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,//to mark selected
                  onTap: (index){
                    isSelectedIndex=index;
                    setState(() {

                    });
                  },
                  //to convert Lis<sources> to List<widget>(List<Item>)
                  tabs: widget.sources.map((sourcesOne) =>
                      TabItem(sourcesOne,
                          isSelectedIndex==widget.sources.indexOf(sourcesOne))).toList(),
                )),

            Expanded(child: NewsData(widget.sources[isSelectedIndex]))
          ],
    ),
        ],
      );
  }
}
