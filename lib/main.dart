import 'package:demo_project/screens/details_page.dart';
import 'package:demo_project/screens/details_page1.dart';
import 'package:demo_project/screens/home_page.dart';
import 'package:demo_project/screens/intro_page.dart';
import 'package:demo_project/screens/drawer_List_Page.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white),
      initialRoute: 'intro_Screen',
      routes: {
        'intro_Screen': (context) => const IntroPage(),
        'home_Page': (context) => const HomePage(),
        'drawer_List_Page': (context) => const DrawerListTopicAndAuthor(),
        'detail_Page': (context) => const DetailPage(),
        'detail_Page1': (context) => const DetailsPage(),
      },
    ),
  );
}
