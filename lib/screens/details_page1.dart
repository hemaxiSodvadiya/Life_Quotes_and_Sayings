import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global/global.dart';
import '../model/model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(9),
                topLeft: Radius.circular(9),
              ),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.hardLight,
                ),
                fit: BoxFit.cover,
                image: MemoryImage(
                  Global.selectedQuote!.image,
                ),
              ),
            ),
            height: height,
            width: width,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "${Global.selectedQuote!.quotes}\n\n - ${Global.selectedQuote!.author}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image,
                      color: Colors.purple,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      QuotesDatas(
                        context: context,
                        res: Global.selectedQuote!,
                      );
                    },
                    icon: const Icon(
                      Icons.copy_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      QuotesDatas(
                        context: context,
                        res: Global.selectedQuote!,
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
                      QuotesDatas(
                        context: context,
                        res: Global.selectedQuote!,
                        isShare: false,
                      );
                    },
                    icon: const Icon(
                      Icons.download,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  QuotesDatas(
      {required BuildContext context,
      required QuotesDataBase res,
      bool? isShare}) async {
    await Clipboard.setData(
      ClipboardData(
        text: """Quote : "${res.quotes}"\n Author : ${res.author}""",
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue,
        content: Text("Quote Copy Successfully 😊..."),
      ),
    );
  }
}
