import 'package:flutter/material.dart';
import 'model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class desc extends StatefulWidget {
  const desc({Key? key}) : super(key: key);

  @override
  State<desc> createState() => _descState();
}

class _descState extends State<desc> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Model? model;
  String? title;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // Future.delayed(Duration.zero, () {
    //   if (ModalRoute.of(context)?.settings.arguments != null) {
    //     final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    //     setState(() {
    //       model = arguments['data'];
    //       title = model!.title.toString();
    //       print(title);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as Model;
    return Scaffold(
      appBar: AppBar(
          title: Text(model.title.toString(),
              style: TextStyle(
                fontSize: 25,
                // color: Colors.black,
                fontWeight: FontWeight.w600,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              height: 350,
              child: Image.network(model.image.toString()),
            ),
            Container(
              // color: Colors.black87,
              //alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(model.category.toString()),
                  Text(
                    model.title.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      //fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Container(
                        // height: 20,
                        // width: 50,
                        child: RatingBar.builder(
                          itemSize: 25,
                          initialRating: double.parse(model.rating!.rate),
                          //initialRating: 5,

                          minRating: 1,
                          direction: Axis.horizontal,

                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {});
                          },
                        ),
                      ),
                      Text(model.rating!.count.toString() + " ratings",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "\₹" + model.price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    model.description.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      //fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // alignment: Alignment.bottomRight,
            ),

            // BottomNavigationBar(
            //     type: BottomNavigationBarType.fixed,
            //     items: <BottomNavigationBarItem>[
            //       // ElevatedButton(onPressed: () {}, child: Text("Add To Cart")),
            //     ])
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // alignment: Alignment.bottomCenter,
        height: 80,
        //color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
              width: 160,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
              width: 160,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[400],
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
