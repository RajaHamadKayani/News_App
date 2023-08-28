import 'package:flutter/material.dart';
import 'package:news_app/utisl/Routes/route_names.dart';

// ignore: must_be_immutable
class HomeScreenDetails extends StatefulWidget {
  String authorName;
  String title;
  String source;
  String description;
  var image;
  HomeScreenDetails(
      {super.key,
      required this.authorName,
      required this.description,
      required this.image,
      required this.source,
      required this.title});

  @override
  State<HomeScreenDetails> createState() => _HomeScreenDetailsState();
}

class _HomeScreenDetailsState extends State<HomeScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.homeScreen);
            },
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xffffffff),
          ),
          title: const Text(
            "Details",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.network(widget.image),
                    ),
                  ),
                  Container(
                    height: 700,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffffffff)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Text(
                            "Details:",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color(0xff000000)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            widget.description,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                                fontSize: 19),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Text(
                            "Source:",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            widget.source,
                            style: const TextStyle(
                                fontSize: 19,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ));
  }
}
