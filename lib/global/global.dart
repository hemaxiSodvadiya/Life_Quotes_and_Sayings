import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../model/model.dart';

class Global {
  static List<DrawerDetails> drawerDetails1 = [
    DrawerDetails(
        icon: Icons.topic_outlined,
        title: "By Topic",
        color: Colors.orangeAccent),
    DrawerDetails(icon: Icons.person, title: "By Author", color: Colors.black),
    DrawerDetails(icon: Icons.star, title: "Favourite", color: Colors.amber),
    DrawerDetails(
        icon: Icons.lightbulb, title: "Quote of the Day", color: Colors.orange),
    DrawerDetails(
        icon: Icons.image, title: "Favourite Pictures", color: Colors.amber),
  ];
  static List<DrawerDetails> drawerDetails2 = [
    DrawerDetails(
        icon: Icons.video_collection, title: "Videos", color: Colors.red),
    DrawerDetails(icon: Icons.settings, title: "Settings", color: Colors.grey),
    DrawerDetails(
        icon: Icons.share_outlined, title: "Share", color: Colors.grey),
    DrawerDetails(icon: Icons.play_arrow, title: "Rate", color: Colors.grey),
    DrawerDetails(icon: Icons.mail, title: "Feedback", color: Colors.grey),
    DrawerDetails(
        icon: Icons.search, title: "Our other apps", color: Colors.grey),
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

  List<String> images = <String>[
    "https://cdn-0.therandomvibez.com/wp-content/uploads/2020/12/Inspirational-Quotes-About-Trying-New-Things.jpg",
    "https://i.pinimg.com/originals/91/b4/8a/91b48af3dc2d7b7b57837d047de217cb.jpg",
    "https://i.pinimg.com/736x/14/f2/13/14f213a50b5a309df034a6004451e1f5.jpg",
    "https://img.ifunny.co/images/13f2b8b8b49144deba4689c8888de2a17fee426a7fd98652e5b4167215ba3e11_1.jpg",
    "https://quotefancy.com/media/wallpaper/3840x2160/3994299-Jacob-Grimm-Quote-How-often-when-we-are-comfortable-we-begin-to.jpg",
    "https://msw.usc.edu/wp-content/uploads/sites/9/2014/02/quote-31.png?w=400",
    "https://quotefancy.com/media/wallpaper/1600x900/7066027-Danna-Faulds-Quote-Trust-the-energy-that-Courses-through-you-Trust.jpg",
    "https://blog.cwf-fcf.org/wp-content/uploads/2017/03/Lao-Tzu-1100x619.jpg",
  ];

  List<String> mostPopular = <String>[
    "Learning Quotes",
    "Life Quotes",
    "Motivational Quotes",
    "Success Quotes"
  ];

  List<String> quotesByAuthor = <String>[
    "Learning Quotes",
    "Life Quotes",
    "Motivational Quotes",
    "Success Quotes"
  ];

  List<String> featured = <String>[
    "Success",
    "Life",
    "Motivational",
    "Sed",
  ];

  List<String> quotesByCategory = <String>[
    "Albert Einstein",
    "Success",
    "Swami vivekananda",
    "Life",
    "Mark Twain",
    "Motivational",
    "Sad",
    "Love",
  ];

  // List<HomeDesignBlocks> homePageLists = <HomeDesignBlocks>[
  //   HomeDesignBlocks(title: "Most Popular", quoteCategoryList: mostPopular),
  //   HomeDesignBlocks(
  //       title: "Quote's By Author", quoteCategoryList: quotesByAuthor),
  //   HomeDesignBlocks(
  //       title: "Quote's By Category",
  //       quoteCategoryList: quotesByCategory,
  //       isGrid: false),
  //   HomeDesignBlocks(title: "Features", quoteCategoryList: featured),
  // ];

  static List editorImageList = [
    "https://c4.wallpaperflare.com/wallpaper/662/990/531/fantasy-book-hd-wallpaper-preview.jpg",
    "https://love-shayari.co/wp-content/uploads/2021/10/sun-rise.jpg",
    "https://images.indianexpress.com/2021/01/NASA-Black-hole.jpg?w=389",
    "https://files.oyebesmartest.com/uploads/large/11576339417nbf6iirjoqpa139ecsh6ut9cveucz9jdmhte0p5skdwzrvehuytxrxbbfcdlkqnn2iylpathicvdutmnuixqjjze11dnkkvf1ex7.png",
    "https://img.freepik.com/premium-vector/hand-painted-background-violet-orange-colours_23-2148427578.jpg?w=360",
    "https://www.rd.com/wp-content/uploads/2020/04/GettyImages-471926619-scaled.jpg?fit=700,467",
    "https://www.w3schools.com/css/paris.jpg",
  ];

  static List<Color> colors = <Color>[
    Colors.white,
    Colors.black,
    Colors.yellowAccent,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.pink,
    Colors.green,
    Colors.blueGrey,
    Colors.indigo,
    Colors.purple,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.black45,
  ];
}
