import 'package:demo_project/model/model.dart';
import 'package:flutter/material.dart';
import '../global/global.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    // QuotesDataBase args =
    //     ModalRoute.of(context)!.settings.arguments as QuotesDataBase;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.6),
                                      BlendMode.hardLight,
                                    ),
                                    fit: BoxFit.cover,
                                    image: MemoryImage(
                                      Global.selectedList[i].image,
                                    ),
                                  ),
                                ),
                                height: 350,
                                width: double.infinity,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  Global.selectedList[i].quotes,
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
                        ],
                      ),
                    ),
                  );
                },
                itemCount: Global.selectedList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
