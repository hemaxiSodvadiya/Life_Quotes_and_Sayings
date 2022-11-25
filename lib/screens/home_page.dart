import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';
import '../helpers/db_helper.dart';
import '../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        backgroundColor: Colors.white,
        title: const Text("Life Quotes and Sayings",
            style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w900)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_on,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      drawer: drawerOpen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              carouselSlider(height: height, width: width),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Global.isAuthorCategory = false;
                        Navigator.of(context).pushNamed("drawer_List_Page");
                      },
                      child: options(
                        color: const Color(0xffA45584),
                        icon: Icons.grid_view,
                        text: "Categories",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: options(
                        color: const Color(0xff7589C8),
                        icon: Icons.image_outlined,
                        text: "Pic Quotes",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Global.tableName = "Latest";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: options(
                        color: const Color(0xffB99041),
                        icon: Icons.sunny,
                        text: "Latest",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: options(
                        color: const Color(0xff6C9978),
                        icon: Icons.menu_book_sharp,
                        text: "Articles",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Most Popular",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "wisdom";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "wisdom"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "Life";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Life"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "Love";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Love"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "Patience";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Patience"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Category",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.isAuthorCategory = false;
                      Navigator.of(context).pushNamed("drawer_List_Page");
                    },
                    child: Text(
                      "View All >",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "sports";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Sports"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "wisdom";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Wisdom"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "life";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Life"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "business";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: category(height: height, category: "Business"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Author",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.isAuthorCategory = true;
                      Navigator.of(context).pushNamed("drawer_List_Page");
                    },
                    child: Text(
                      "View All >",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "albert_einstein";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffFDE490),
                          author: "Albert\nEinstein"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "elon_musk";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffF5DBCE),
                          author: "Elon\nMusk"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "TedWilliams";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffF6CDDF),
                          author: "TedWilliams"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "dr_seuss";
                        Navigator.of(context).pushNamed("detail_Page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffB8D7E9),
                          author: "Dr Seuss"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawerOpen() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: const Color(0xffa55c89),
              alignment: Alignment.center,
              child: Text(
                "Life Quotes and\nSayings",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ...Global.drawerDetails1.map((e) {
              return ListTile(
                onTap: () {
                  if (e.title == "By Topic") {
                    Global.isAuthorCategory = false;
                    Navigator.of(context).pushNamed("drawer_List_Page");
                  } else if (e.title == "By Author") {
                    Global.isAuthorCategory = true;
                    Navigator.of(context).pushNamed("drawer_List_Page");
                  }
                },
                leading: Icon(
                  e.icon,
                  color: e.color,
                  size: 30,
                ),
                title: Text(
                  e.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              );
            }),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text("Communicate",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w900)),
            ),
            ...Global.drawerDetails2.map(
              (e) => ListTile(
                onTap: () {},
                leading: Icon(
                  e.icon,
                  color: const Color(0xff666666),
                  size: 30,
                ),
                title: Text(
                  e.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  authorContainer(
      {required double height, required String author, required var color}) {
    return Container(
      height: height * 0.230,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        author,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  category({required double height, required String category}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.142,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.hardLight,
              ),
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://source.unsplash.com/random/?2background,$category,dark",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 3),
          child: Text(
            "$category Quotes",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  carouselSlider({required double height, required double width}) {
    int index = 0;

    return FutureBuilder(
      future: DBHelper.dbHelper.fetchAllRecords(tableName: "Latest"),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          List<QuotesDataBase>? res = snapShot.data;

          return InkWell(
            onTap: () {
              Global.selectedQuote = res![index];
              Navigator.of(context).pushNamed(
                "detail_Page",
              );
            },
            child: CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (val, _) {
                  index = val;
                },
                height: height * 0.26,
                autoPlay: true,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: res?.map((e) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.hardLight,
                      ),
                      fit: BoxFit.cover,
                      image: MemoryImage(
                        e.image,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    e.quotes,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        } else if (snapShot.hasError) {
          return Center(
            child: Text("${snapShot.error}"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  options({required var color, required var icon, required String text}) {
    return SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            height: 52,
            width: 52,
            child: Icon(icon, color: Colors.white, size: 27),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
