import 'package:application_de_flux_rss/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:application_de_flux_rss/models/parser.dart';
import 'package:webfeed/domain/media/content.dart';
import 'package:webfeed/webfeed.dart';

class list extends StatefulWidget {
  late RssFeed? feed;

  list(RssFeed feed) {
    this.feed = feed;
  }
  @override
  _list createState() => _list();
}

class _list extends State<list> {
  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width / 2.5;
    return ListView.builder(
      itemCount: widget.feed!.items?.length,
      itemBuilder: (context, i) {
        RssItem? item = widget.feed?.items![i];
        return Container(
          padding: EdgeInsets.all((10.0)),
          child: Card(
            elevation: 10.0,
            child: InkWell( 
              onTap: (){

              },
              child:Column(
                children: [
                  padding(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textCustom("${item!.author}"),
                    textCustom(
                      "${item.pubDate}",
                      color: Colors.red,
                    )
                  ],
                ),
                padding(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 7.5,
                      child: Container(
                        width: taille,
                        child: Image.network(
                          "${item!.enclosure?.url}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    padding(), 
                    Container(
                      width: taille, 
                      child: textCustom("${item.title}"),
                    )
                  ],
                ),
                ]
              ),
              
            ),
          ),
        );
      },
    );
  }

  Padding padding(){
    return Padding(padding: EdgeInsets.only(top: 10.0));
  }
}
