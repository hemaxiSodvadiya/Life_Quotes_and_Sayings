import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class DrawerDetails {
  final IconData icon;
  final String title;
  final Color color;

  DrawerDetails({required this.icon, required this.title, required this.color});
}

class Quotes {
  final String quot;
  final String author;
  final Uint8List image;

  Quotes({required this.quot, required this.author, required this.image});

  factory Quotes.fromJSON(Map data, Uint8List image) {
    return Quotes(quot: data["content"], author: data["author"], image: image);
  }
}

class QuotesDataBase {
  final String quotes;
  final String author;
  late Uint8List image;

  QuotesDataBase({required this.quotes, required this.author, required this.image});

  factory QuotesDataBase.fromJSON(Map data) {
    return QuotesDataBase(
        quotes: data["quote"], author: data["author"], image: data["image"]);
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