import 'package:flutter/material.dart';
import 'package:application_de_flux_rss/widgets/text.dart';

class Chargement extends StatelessWidget{

  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: textCustom("Chargement en cours...!!", 
      fontStyle: FontStyle.italic,
      fontSize: 30.0,
      ),
    );
  }
}