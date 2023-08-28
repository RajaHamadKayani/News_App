import 'package:flutter/material.dart';
import 'package:news_app/utisl/Routes/route_names.dart';

// ignore: must_be_immutable
class HeadlineDetails extends StatefulWidget {
  dynamic image;
  String title;
  String description;
  String author;
  String source;

  HeadlineDetails({
    Key? key,
    required this.author,
    required this.description,
    required this.image,
    required this.source,
    required this.title,
  }) : super(key: key);

  @override
  State<HeadlineDetails> createState() => _HeadlineDetailsState();
}

class _HeadlineDetailsState extends State<HeadlineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Headline Details",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.homeScreen);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (widget.image != null) // Check if image is not null
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(widget.image)),
                    )
                  else
                    const Center(
                      child:
                          CircularProgressIndicator(), // Show a loading indicator
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
              ),
            ),
            Container(
              height: 700,
              width: double.infinity,
              decoration: const BoxDecoration(),
            )
          ],
        ),
      ),
    );
  }
}
