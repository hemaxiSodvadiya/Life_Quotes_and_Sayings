import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global.dart';


class DrawerListTopicAndAuthor extends StatefulWidget {
  const DrawerListTopicAndAuthor({Key? key}) : super(key: key);

  @override
  State<DrawerListTopicAndAuthor> createState() => _DrawerListTopicAndAuthorState();
}

class _DrawerListTopicAndAuthorState extends State<DrawerListTopicAndAuthor> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Quotes By ${(Global.isAuthorCategory) ? "Author" : "Category"}",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: (Global.isAuthorCategory)
            ? Global.authorCategory.length
            : Global.quoteCategory.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              (Global.isAuthorCategory)
                  ? Global.isAuthor = true
                  : Global.isAuthor = false;
              Global.tableName = (Global.isAuthorCategory)
                  ? Global.authorCategory[i].category
                  : Global.quoteCategory[i].category;
              Navigator.of(context).pushNamed("detail_Page");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .withOpacity(0.8),
                        child: Text(
                          (Global.isAuthorCategory)
                              ? Global.authorCategory[i].title.substring(0, 2)
                              : Global.quoteCategory[i].title.substring(0, 2),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 1,                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        (Global.isAuthorCategory)
                            ? Global.authorCategory[i].title
                            : Global.quoteCategory[i].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width / 4.0 * 3,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
