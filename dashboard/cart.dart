import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/dashboard/checkout.dart';
import 'package:flutter_application_1/dashboard/datacart.dart';
import 'package:flutter_application_1/dashboard/detail.dart';
import 'package:provider/provider.dart';
import '../chat/chathome.dart';
import 'datamine.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<DataCart>().items;
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  child: Image.asset(cart[index].image),
                ),
                SizedBox(width: 10),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart[index].nama,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text("Rp.${cart[index].harga}"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 40,
                              width: 40,
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
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.chat),
                                  onPressed: (() {}),
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 40,
                              width: 40,
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
                              child: Center(
                                child: IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: (() {}),
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(
                            width: 8,
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
                                borderRadius: BorderRadius.circular(8)),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(todo: cart[index])));
                                },
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size(20, 20),
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
