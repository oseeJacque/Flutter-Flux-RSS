import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/webfeed.dart';
import 'text.dart';

class Grid extends StatefulWidget {
  late RssFeed? feed;

  Grid(RssFeed? feed) {
    this.feed = feed;
  }

  @override
  _Grid createState() => _Grid();
}

class _Grid extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          RssItem? item = widget.feed?.items![i];
          return InkWell(
            onTap: (() => null),
            child: Card(
              elevation: 10.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  padding(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      textCustom("${item?.author}"),
                      textCustom("${item?.pubDate}", color: Colors.red)
                    ],
                  ),
                  padding(),
                  textCustom("${item?.title}"), 
                  padding(),
                  Card(
                    elevation: 7.5,
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image.network("${item!.enclosure?.url}")),
                  ),
                ],
              ),
            ),
          );
        });
  }
  Padding padding(){
    return Padding(padding: EdgeInsets.only(top: 10.0));
  }
}
