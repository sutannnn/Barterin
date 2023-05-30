import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import 'package:flutter_application_1/dashboard/datacart.dart';
import '../chat/chathome.dart';
import 'datamine.dart';
import 'home.dart';

class Checkout extends StatefulWidget {
  Checkout({super.key, required this.todo});

  final Photo todo;

  @override
  State<Checkout> createState() => _CheckoutState(todo);
}

class _CheckoutState extends State<Checkout> {
  final Photo todo;
  bool? check = false;
  // final List<DataCart> data = List.generate(
  //     2, (index) => DataCart('images/rubik.png', "Rubik", "Sutan P", "50.000"));

  _CheckoutState(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromRGBO(255, 145, 16, 1),
                    Color.fromRGBO(251, 214, 115, 1)
                  ]),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 40,
                color: Color.fromRGBO(255, 145, 16, 1),
              ),
              Column(
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Container(
                      width: 175,
                      child: Text(
                        "Joe Anna | (+62) 8123-4567-890 Jln Hatimu XIA no 12 Indonesia",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w400),
                      ))
                ],
              )
            ],
          ),
          Container(
            width: double.infinity,
            child: Image.asset(
              "images/co.png",
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                size: 30,
              ),
              Text(
                "Bayu Suci",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Card(
            elevation: 0,
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  child: Image.asset(todo.image),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black38)),
                ),
                SizedBox(width: 15),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.nama,
                        style: TextStyle(fontSize: 27),
                      ),
                      Text(
                        "Lorem lore lorem is or loremku\nloremitu adalah apaa loremku\nlorem what aaku isss loremku\npenegtahuan itu sangat penting",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Rp${todo.harga}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            // color: Color.fromRGBO(255, 184, 0, 0.2),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Color.fromRGBO(255, 184, 0, 1)))),
            child: Stack(children: [
              Container(
                height: 80,
                width: double.infinity,
                color: Color.fromRGBO(255, 184, 0, 0.2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Opsi Pengiriman",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromRGBO(255, 184, 0, 1),
                  ),
                  InkWell(
                    onTap: (() {}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reguler",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "Rp${todo.harga}",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Text(
                    "Akan diterima dalam 3 hari",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            height: 45,
            width: double.infinity,
            // color: Color.fromRGBO(255, 184, 0, 0.2),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Color.fromRGBO(255, 184, 0, 1)))),
            child: Stack(children: [
              Container(
                height: 45,
                width: double.infinity,
                color: Color.fromRGBO(255, 184, 0, 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Metode Pembayaran",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Text(
                                "COD",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.keyboard_arrow_right),
                            ],
                          ))
                        ],
                      ),
                    ),
                    Text(
                      "Akan diterima dalam 3 hari",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            height: 135,
            width: double.infinity,
            // color: Color.fromRGBO(255, 184, 0, 0.2),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Color.fromRGBO(255, 184, 0, 1)))),
            child: Stack(children: [
              Container(
                height: 135,
                width: double.infinity,
                color: Color.fromRGBO(255, 184, 0, 0.2),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rincian Pembayaran",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromRGBO(255, 184, 0, 1),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal untuk produk",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Rp${todo.harga}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal Pengiriman",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Rp10.000",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biaya Layanan",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Rp1.000",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biaya Penanganan",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Rp1.000",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Rp${todo.harga + 1000 + 1000 + 10000}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rp62.000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
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
                    borderRadius: BorderRadius.circular(0)),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0)), //this right here
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Color.fromRGBO(255, 145, 16, 1),
                                      Color.fromRGBO(251, 214, 115, 1)
                                    ]),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Selamat! Anda telah membuat pesanan'),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black54
                                        ),
                                        child: Text(
                                          "Oke",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Buat Pesanan",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(130, 45),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.selected,
    MaterialState.focused,
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.orange;
  }
  return Color.fromRGBO(255, 145, 16, 1);
}
