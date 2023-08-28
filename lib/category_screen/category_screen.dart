import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<dynamic> list = [];
  fetchCategoriesData(String category) async {
    var data;
    final response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=${initialCategory}&apiKey=7374f431d3ae4ad8a5cb169342ec0f1d"),
      headers: {"Authorization": "7374f431d3ae4ad8a5cb169342ec0f1d"},
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      list = data["articles"];
    } else {
      print("Can not fetch because status code is ${response.statusCode}");
    }
  }

  String initialCategory = "general";
  List<String> categoriesNames = [
    "General",
    "Bussiness",
    "Sports",
    "Entertainment",
    "Technology",
    "Health"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Category",
          style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05),
                      child: InkWell(
                        onTap: () {
                          initialCategory = categoriesNames[index];
                          setState(() {});
                        },
                        child: ClipRRect(
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: initialCategory == categoriesNames[index]
                                    ? Colors.blue
                                    : Colors.grey),
                            child: Center(
                              child: Text(
                                categoriesNames[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchCategoriesData(initialCategory),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime =
                          DateTime.parse(list[index]["publishedAt"]);
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          child: Container(
                            width: double
                                .infinity, // Set a fixed width to constrain the row
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Container(
                                    height: 200,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff0000000), width: 1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: list[index]["urlToImage"] != null
                                        ? CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: list[index]["urlToImage"])
                                        : Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        16), // Add some spacing between the image and text
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index]["title"],
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Text(
                                          dateTime.toString(),
                                          style: TextStyle(color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
