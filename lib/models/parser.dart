
// ignore_for_file: avoid_print

import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Parser{

  final url="http://www.france24.com/fr/actualites/rss";
  Future  <RssFeed?> chagerRsss() async {
    final client=http.Client();
    final reponse=await client.get(Uri.parse(url));
    if(reponse.statusCode==200){
      final feed=RssFeed.parse(reponse.body);
      return feed;
    }else{
      print("Erreur de chargement ${reponse.statusCode}");
      return  null;
    }
  }
}