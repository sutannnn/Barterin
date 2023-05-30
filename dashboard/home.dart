import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/account.dart';
import 'package:flutter_application_1/dashboard/cart.dart';
import 'package:flutter_application_1/dashboard/datacart.dart';
import 'package:flutter_application_1/dashboard/detail.dart';
import 'package:flutter_application_1/dashboard/mine.dart';
import 'package:flutter_application_1/dashboard/tambah.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../ad_helper.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://192.168.103.168:8000/barterin'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody)['mine'].cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id, harga;
  final String nama, kategori, image, deskripsi;

  const Photo(
      {required this.id,
      required this.nama,
      required this.harga,
      required this.kategori,
      required this.image,
      required this.deskripsi});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        id: json['id'] as int,
        nama: json['nama'] as String,
        harga: json['harga'] as int,
        kategori: json['kategori'] as String,
        image: json['image'] as String,
        deskripsi: json['deskripsi'] as String);
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  
  BannerAd? _bannerAd;

  @override
  void initState() {
    // TODO: Load a banner ad
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();

    super.dispose();
  }
  double itemHeight = 235;
  double itemWidth = 160;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<FutureBuilder> myList = List.generate(3, (index) {
      return FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                elevation: 10,
                child: InkWell(
                  splashColor: Colors.yellow.withAlpha(100),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDetail(todo: snapshot.data![index+4])));
                  },
                  child: SizedBox(
                      height: 175,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            snapshot.data![index+4].image,
                            fit: BoxFit.fill,
                            width: 200,
                            height: 125,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data![index+4].nama,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Nama Pemilik",
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, top: 8),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(255, 145, 16, 1),
                                          Color.fromRGBO(251, 214, 115, 1)
                                        ]),
                                  ),
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
    final List<FutureBuilder> myList2 = List.generate(4, (index) {
      return FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              elevation: 10,
              child: InkWell(
                splashColor: Colors.yellow.withAlpha(100),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDetail(todo: snapshot.data![index])));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      snapshot.data![index].image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].nama,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Sutan",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(snapshot.data![index].harga, 0),
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              context.read<DataCart>().add(snapshot.data![index]);
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(255, 145, 16, 1),
                                      Color.fromRGBO(251, 214, 115, 1)
                                    ]),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    });
    final appbars = [
      AppBar(
        toolbarHeight: 100,
        flexibleSpace: Image(
          image: AssetImage('images/profilebg.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            child: Image.asset(
              'images/photo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "Welcome, User",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.notifications_none,
              size: 30,
              color: Colors.black54,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(height: 53, width: 292),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search...",
                    labelStyle: const TextStyle(
                        color: Color.fromRGBO(157, 154, 154, 1), fontSize: 15),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(214, 214, 214, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(height: 53, width: 66),
                      child: IconButton(
                        icon: const Icon(Icons.tune),
                        onPressed: () {},
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
      AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Barterku",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TambahBarang()));
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ))
          ],
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
      AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Keranjang",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<DataCart>().removeAll();
              }, 
              icon: Icon(Icons.delete_forever, color: Colors.black87, size: 35,)
            ),
            SizedBox(width: 10,),
          ],
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
      AppBar(
        toolbarHeight: 150,
        flexibleSpace: Image(
          image: AssetImage('images/appbar.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.create,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(height: 130, width: 130),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Image.asset("images/photo.png"),
                )),
          ),
        ),
      ),
    ];
    final bodys = [
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (_bannerAd != null)
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15, right: 150),
              child: Text(
                "Penawaran Menarik",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: myList),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mungkin Disukai",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Lihat Semua",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(255, 146, 17, 1)),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: myList2,
              ),
            ),
          ],
        ),
      ),
      const Mine(),
      const Cart(),
      const Account()
    ];

    return Scaffold(
      appBar: appbars[currentIndex],
      body: bodys[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(255, 145, 16, 1), size: 30),
        selectedItemColor: const Color.fromRGBO(255, 145, 16, 1),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dehaze),
            label: 'Mine',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
