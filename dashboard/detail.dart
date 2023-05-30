import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat/chathome.dart';
import 'package:flutter_application_1/dashboard/checkout.dart';
import 'package:flutter_application_1/dashboard/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';

class MyDetail extends StatefulWidget {
  const MyDetail({super.key, required this.todo});

  final Photo todo;

  @override
  State<MyDetail> createState() => _MyDetail(todo: todo);
}

class _MyDetail extends State<MyDetail> {
  _MyDetail({required this.todo});

  final Photo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Banner(
          message: "Barterin",
          location: BannerLocation.topStart,
          color: Color.fromRGBO(255, 145, 16, 1),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              FavoriteButton(valueChanged: () {}),
            ],
          )
        ],
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Color.fromRGBO(255, 145, 16, 1)),
        backgroundColor: Colors.white,
        toolbarHeight: 350,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(13),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          // background: todo.image
          background: Image.asset(todo.image, fit: BoxFit.cover),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                todo.nama,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(
                CurrencyFormat.convertToIdr(todo.harga, 0),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              )
            ]),
            Row(
              children: [
                StarButton(
                  valueChanged: () {},
                  iconSize: 33,
                ),
                StarButton(
                  valueChanged: () {},
                  iconSize: 33,
                ),
                StarButton(
                  valueChanged: () {},
                  iconSize: 33,
                ),
                StarButton(
                  valueChanged: () {},
                  iconSize: 33,
                ),
                StarButton(
                  valueChanged: () {},
                  iconSize: 33,
                ),
              ],
            ),
            Text(
              todo.deskripsi,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 145, 16, 1),
                        Color.fromRGBO(251, 214, 115, 1)
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(189),
                      bottomRight: Radius.circular(189),
                      topLeft: Radius.circular(189)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatHome()));
                  },
                  child: Icon(
                    Icons.chat,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(189),
                            bottomRight: Radius.circular(189),
                            topLeft: Radius.circular(189)),
                      )),
                ),
              ),
              VerticalDivider(
                color: Color.fromRGBO(192, 192, 192, 1),
                thickness: 1,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 145, 16, 1),
                        Color.fromRGBO(251, 214, 115, 1)
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(189),
                      bottomRight: Radius.circular(189),
                      topLeft: Radius.circular(189)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyHome())
                    // );
                  },
                  child: Icon(
                    Icons.share,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(50, 50),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(189),
                            bottomRight: Radius.circular(189),
                            topLeft: Radius.circular(189)),
                      )),
                ),
              ),
              VerticalDivider(
                color: Color.fromRGBO(192, 192, 192, 1),
                thickness: 1,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(255, 145, 16, 1),
                          Color.fromRGBO(251, 214, 115, 1)
                        ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(189),
                        bottomLeft: Radius.circular(189),
                        bottomRight: Radius.circular(189))),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Checkout(todo: todo)));
                  },
                  child: Text(
                    "Beli",
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(170, 47),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            topLeft: Radius.circular(189),
                            bottomLeft: Radius.circular(189),
                            bottomRight: Radius.circular(189)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
