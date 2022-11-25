import 'dart:io';
import 'package:demo_project/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../global/global.dart';
import '../helpers/db_helper.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        title: Text(
          Global.tableName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchAllRecords(tableName: Global.tableName),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<QuotesDataBase>? res = snapShot.data;

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: res!.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Global.selectedQuote = res[i];
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: 420,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.6),
                                          BlendMode.hardLight,
                                        ),
                                        fit: BoxFit.cover,
                                        image: MemoryImage(
                                          res[i].image,
                                        ),
                                      ),
                                    ),
                                    height: 350,
                                    width: double.infinity,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      res[i].quotes,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 70,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            "change",
                                            arguments: res[i]);
                                      },
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        QuotesData(
                                          context: context,
                                          res: res[i],
                                          isShare: false,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.copy_rounded,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        QuotesData(
                                          context: context,
                                          res: res[i],
                                          isShare: true,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        QuotesData(
                                          context: context,
                                          res: res[i],
                                          isShare: false,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        res[i].favorite = !res[i].favorite;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                          res[i].favorite
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          color: const Color(0xff303030)),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: const Icon(
                                    //     Icons.star_border,
                                    //     color: Colors.teal,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else if (snapShot.hasError) {
            return Center(
              child: Text("${snapShot.error}"),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  QuotesData(
      {required BuildContext context,
      required QuotesDataBase res,
      required bool isShare}) {
    Global.screenshotController
        .captureFromWidget(
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.hardLight,
                ),
                fit: BoxFit.cover,
                image: MemoryImage(
                  res.image,
                ),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "${res.quotes}\n\n - ${res.author}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    )
        .then(
      (Uint8List? image) async {
        if (image != null) {
          final directory = await getApplicationDocumentsDirectory();
          final imagePath = await File('${directory.path}/image.png').create();
          await imagePath.writeAsBytes(image);
          isShare
              ? await Share.shareFiles([imagePath.path])
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    content: Text("image Save Successfully"),
                  ),
                );
        }
      },
    );
  }
}
