import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:store/desc.dart';
import 'package:store/model.dart';
import 'main.dart';
import 'api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Model>? model;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Flutter store"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.shopping_bag,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Container(
          //   child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () {},
          //         child: Column(children: [
          //           Container(
          //             height: 20,
          //             child:
          //                 //Text(data[index].category.toString()),
          //                 Text("aaf"),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           ),
          //         ]),
          //       );
          //     },
          //   ),
          // ),
          FutureBuilder(
              future: Api.getproducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Model> data = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //
                          Text(
                            "Deals of the day",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          GridView.builder(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 0.59,
                                      maxCrossAxisExtent: 300),
                              itemCount: 20,
                              itemBuilder: (BuildContext cxt, index) {
                                return InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pushNamed(
                                      //   '/desc',
                                      //   arguments: {
                                      //     'data': data[index],
                                      //   },
                                      // );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => desc(),
                                              settings: RouteSettings(
                                                arguments: data[index],
                                              )));
                                    },
                                    child: Card(
                                      child: Column(children: [
                                        Container(
                                          padding: EdgeInsets.all(20.0),
                                          height: 200,
                                          child: Image.network(
                                              data[index].image.toString()),
                                        ),
                                        Container(
                                          // color: Colors.black87,
                                          //alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].category.toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black26,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(data[index].title.toString(),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              Text(
                                                "\₹" +
                                                    data[index]
                                                        .price
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // alignment: Alignment.bottomRight,
                                        )
                                      ]),
                                      // height: 40,

                                      // alignment: Alignment.centerLeft,
                                      // decoration: BoxDecoration(
                                      //   color: Colors.white,
                                      // ),
                                    ));
                              }),
                        ]),
                  );
                } else {
                  return Text("Empty");
                }
              }),
        ],
      )),
    );
  }
}
