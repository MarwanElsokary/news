import 'package:api/apis/api_manager.dart';
import 'package:api/news_item.dart';
import 'package:flutter/material.dart';
import 'tab_item.dart';

class TabBarWidget extends StatefulWidget {
  String id;
   TabBarWidget({required this.id,super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        var sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        selectedTabIndex = value;
                        setState(() {});
                      },
                      tabs: sources
                          .map((e) => TabItem(
                                isSelected:
                                    sources.elementAt(selectedTabIndex) == e
                                        ? true
                                        : false,
                                sources: e,
                              ))
                          .toList()),
                )),
            FutureBuilder(
              future:
                  ApiManager.getNewsData(sources[selectedTabIndex].id ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Somthing went worng");
                }
                var articals = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return NewsItem(article: articals[index],);
                    },
                    itemCount: articals.length,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
