import 'package:flutter/material.dart';
import 'package:application_de_flux_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'dart:async';
import 'package:application_de_flux_rss/widgets/chargement.dart';
import 'package:application_de_flux_rss/widgets/list.dart';
import 'grid.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RssFeed? feed = null;

  @override
  void initState() {
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: choixDuBody(),
    );
  }

  Widget? choixDuBody() {
    // ignore: unnecessary_null_comparison
    if (feed == null) {
      return Chargement();
    } else {
      Orientation orientetion = MediaQuery.of(context).orientation;
      if (orientetion == Orientation.portrait) {
        return list(feed!);
      } else {
        return Grid(feed);
      }
    }
    return null;
  }

  Future<Null> parse() async {
    RssFeed? recu = await Parser().chagerRsss();
    // ignore: unnecessary_null_comparison
    if (recu != null) {
      setState(() {
        feed = recu;
        feed!.items?.forEach((feedItem) {
          RssItem item = feedItem;
          print(item.title);
          print(item.enclosure?.url);
          print(item.pubDate);
        });
      });
    }
  }
}
