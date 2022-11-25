import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../model/model.dart';

class Quotes_Detail_Page extends StatefulWidget {
  const Quotes_Detail_Page({Key? key}) : super(key: key);

  @override
  State<Quotes_Detail_Page> createState() => _Quotes_Detail_PageState();
}

class _Quotes_Detail_PageState extends State<Quotes_Detail_Page> {
  TextAlign textDirection = TextAlign.center;
  IconData textAlignButtonIcon = Icons.format_align_center_rounded;
  Color textColor = Colors.white;
  bool showData = false;

  List<String> fontList = [
    'Sono',
    'Rubic',
    'Oswald',
    'NotoSans',
    'Teko',
    'Lobster'
  ];
  String isSelect = 'Rubic';

  List<bool> isSelected =
      List.generate(Global.quoteCategory.length, (index) => false);
  bool onselected = false;
  Random random = Random();
  Uint8List? vlist;
  List<Uint8List> all = [];
  //List<String> all = [];
  String name = "poppins";
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    QuotesDataBase args =
        ModalRoute.of(context)!.settings.arguments as QuotesDataBase;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Change Your Style"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Quote Download Successfully",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 14);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.download)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
            // /height: 130,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: (isChanged == false)
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: MemoryImage(args!.image),
                      fit: BoxFit.cover,
                    ),
                  )
                : BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(args.changeImageList!),
                      fit: BoxFit.cover,
                    ),
                  ),
            child: Text(
              args!.quotes,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
              textAlign: textDirection,
            ),
          ),
          const SizedBox(height: 10),
          showData
              ? Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: Global.colors
                        .map((e) => FloatingActionButton(
                            elevation: 2,
                            mini: true,
                            backgroundColor: e,
                            onPressed: () {
                              setState(() {
                                textColor = e;
                              });
                            }))
                        .toList(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(
                Icons.photo,
                color: Color(0xff303030),
              ),
              onPressed: () async {
                setState(() {
                  // args.changeImageList =
                  //     ((Global.changeImageList.indexOf(args.changeImageList) ==
                  //             Global.changeImage.length - 1)
                  //         ? Global.changeImage[0]
                  //         : Global.changeImage[
                  //             Global.changeImage.indexOf(args.changeImageList) +
                  //                 1]);

                  isChanged = true;
                  args.changeImageList =
                      (Global.editorImageList.indexOf(args.changeImageList!) ==
                              Global.editorImageList.length - 1)
                          ? Global.editorImageList[0]
                          : Global.editorImageList[Global.editorImageList
                                  .indexOf(args.changeImageList!) +
                              1];
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.color_lens_outlined,
                color: Color(0xff303030),
              ),
              onPressed: () {
                setState(() {
                  showData = !showData;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.copy_rounded,
                color: Color(0xff303030),
              ),
              onPressed: () async {
                ClipboardData data = ClipboardData(text: args.quotes);
                await Clipboard.setData(data);
                Fluttertoast.showToast(
                    msg: "Quote Copied Successfully",
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 14);
              },
            ),
            IconButton(
              icon: Icon(
                  args.favorite ? Icons.star : Icons.star_border_outlined,
                  color: const Color(0xff303030)),
              onPressed: () {
                args.favorite = !args.favorite;
                setState(() {
                  Global.selectedList.add(args);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
