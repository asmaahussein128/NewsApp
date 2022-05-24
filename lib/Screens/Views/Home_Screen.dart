import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Controllor/Api.dart';
import 'package:news/Controllor/Function_api.dart';
import 'package:news/Models/Constants.dart';
import 'package:news/Screens/Widgets/Bottems.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Category_News.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //void _launchUrl(var Url) async {
  //if (!await launchUrl(Uri.parse(Url))) throw 'Could not launch $Url'; }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Choose type of news... !",
            style: TextStyle(
                color: Colors.black,
                fontSize: largXfont,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Button(type: "general", color: red),
                Button(type: "sports", color: green),
                Button(type: "science", color: pank),
                Button(type: "technology", color: blue),
                Button(type: "business", color: reds),
                Button(type: "health", color: white),
                Button(type: "entertainment", color: Textcolor),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Best news..",
            style: TextStyle(
                color: Colors.black,
                fontSize: largfont,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: FutureBuilder(
            future: Api.fetchArticales(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: GestureDetector(
                        onTap: () {
                          Fun.openLink("${snapshot.data[index].url}");
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage((snapshot
                                                    .data[index].urlToImage ==
                                                null)
                                            ? "https://unsplash.com/photos/9RelUTU7zLE"
                                            : "${snapshot.data[index].urlToImage}"))),
                              ),
                              Text(
                                "${snapshot.data[index].title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: smallfont,
                                    color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            Fun.ShareLink(
                                                "${snapshot.data[index].url}");
                                          });
                                        },
                                        icon: Icon(
                                          Icons.share,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            Fun.copyLink(
                                                    "${snapshot.data[index].url}")
                                                .then((value) {
                                              final snackBar = SnackBar(
                                                  content: Text("Copy...."));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            });
                                          });
                                        },
                                        icon: Icon(
                                          Icons.copy_rounded,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ));
              }
            },
          )),
        ]),
      ),
    );
  }
}
