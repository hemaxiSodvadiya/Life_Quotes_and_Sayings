import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../model/model.dart';

class Global{

   static List<DrawerDetails> drawerDetails1 = [
    DrawerDetails(
        icon: Icons.topic_outlined, title: "By Topic", color: Colors.orangeAccent),
    DrawerDetails(icon: Icons.person, title: "By Author", color: Colors.black),
    DrawerDetails(icon: Icons.star, title: "Favourite", color: Colors.amber),
    DrawerDetails(
        icon: Icons.lightbulb,
        title: "Quote of the Day",
        color: Colors.orange),
    DrawerDetails(
        icon: Icons.image, title: "Favourite Pictures", color: Colors.amber),

  ];
 static List<DrawerDetails> drawerDetails2 = [
    DrawerDetails(icon: Icons.video_collection, title: "Videos", color: Colors.red),
    DrawerDetails(icon: Icons.settings, title: "Settings", color: Colors.grey),
    DrawerDetails(icon: Icons.share_outlined, title: "Share", color: Colors.grey),
    DrawerDetails(icon: Icons.play_arrow, title: "Rate", color: Colors.grey),
    DrawerDetails(icon: Icons.mail, title: "Feedback", color: Colors.grey),
    DrawerDetails(icon: Icons.search, title: "Our other apps", color: Colors.grey),
    DrawerDetails(icon: Icons.info_outline, title: "About", color: Colors.grey),
  ];



   static String tableName = "";

   static QuotesDataBase? selectedQuote;

   static ScreenshotController screenshotController = ScreenshotController();

   static bool isAuthor = false;
   static bool isAuthorCategory = false;

   static List<Category> quoteCategory = [
     Category(category: "business", title: "Business"),
     Category(category: "competition", title: "Competition"),
     Category(category: "Latest", title: "Famous Quotes"),
     Category(category: "friendship", title: "Friendship"),
     Category(category: "future", title: "Future"),
     Category(category: "inspirational", title: "Inspirational"),
     Category(category: "life", title: "Life"),
     Category(category: "love", title: "Love"),
     Category(category: "motivational", title: "Motivational"),
     Category(category: "sports", title: "Sports"),
     Category(category: "wisdom", title: "Wisdom"),
   ];

   static List<Category> authorCategory = [
     Category(category: "albert_einstein", title: "Albert Einstein"),
     Category(category: "AnnaPavlova", title: "AnnaPavlova"),
     Category(category: "chanakya", title: "Chanakya"),
     Category(category: "DesmondTutu", title: "DesmondTutu"),
     Category(category: "donald_trump", title: "Donald Trump"),
     Category(category: "dr_seuss", title: "Dr Seuss"),
     Category(category: "elon_musk", title: "Elon Musk"),
     Category(category: "MichaelJordan", title: "MichaelJordan"),
     Category(category: "MuhammadAli", title: "MuhammadAli"),
     Category(category: "robert_griffin_iii", title: "Robert Griffin Iii"),
     Category(category: "TedWilliams", title: "TedWilliams"),
   ];

}