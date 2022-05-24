import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Controllor/Api.dart';
import 'package:news/Controllor/Function_api.dart';
import 'package:news/Models/Constants.dart';


class Category extends StatefulWidget {
  static const String route = "Category";
 late String Category11;
  Category({required this.Category11});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  dynamic fun(){
   if(widget.Category11=="general"){
     return red;
   }
   else if(widget.Category11=="sports"){
     return green;

    }
   else if(widget.Category11=="science"){
     return pank;
    }
   else if(widget.Category11=="technology"){
     return blue;
    }
   else if(widget.Category11=="business"){
     return reds;
    }
   else if(widget.Category11=="health"){
     return white;
    }
else{
  return Textcolor;
   }
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          //actions: [IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back))],
        centerTitle: true,
        title: Text(
        widget.Category11,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

   backgroundColor: fun()  ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Expanded(
              child: FutureBuilder(
                future: Api.fetchcategoryArticales("${widget.Category11}"),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: GestureDetector(onTap: (){
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
                                                Fun.ShareLink("${snapshot.data[index].url}");
                                              });
                                            },
                                            icon: Icon(
                                              Icons.share,
                                              size: 30,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Fun.copyLink("${snapshot.data[index].url}").then((value){
                                                  final snackBar=SnackBar(content: Text("Copy...."));
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                        child: Container(height: 80,width: 80,
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
