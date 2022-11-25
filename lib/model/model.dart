import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class DrawerDetails {
  final IconData icon;
  final String title;
  final Color color;
  String? routes;

  DrawerDetails(
      {required this.icon,
      required this.title,
      required this.color,
      this.routes});
}

class Quotes {
  final String quot;
  final String author;
  final Uint8List image;
  bool favorite;

  Quotes(
      {required this.quot,
      required this.author,
      required this.image,
      required this.favorite});

  factory Quotes.fromJSON(Map data, Uint8List image) {
    return Quotes(
        quot: data["content"],
        author: data["author"],
        image: image,
        favorite: false);
  }
}

class QuotesDataBase {
  final String quotes;
  final String author;
  late Uint8List image;
  bool favorite;
  String? changeImageList;

  QuotesDataBase(
      {required this.quotes,
      required this.author,
      required this.image,
      required this.favorite,
      this.changeImageList});

  factory QuotesDataBase.fromJSON(Map data) {
    return QuotesDataBase(
        quotes: data["quote"],
        author: data["author"],
        image: data["image"],
        favorite: false,
        changeImageList:
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg");
  }
}

class Category {
  final String category;
  final String title;

  Category({
    required this.category,
    required this.title,
  });
}
