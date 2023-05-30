import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'datapesan.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DataPesan> myData = List.generate(
      4,
      (index) => DataPesan(
          'images/photo.png',
          "Sutan Parsaulian",
          "Apakah barang masih ada?dfsfsefsefefsfsefsefsefeffsfsefesfsefsfsffsfsf",
          "12.00"));

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Pesan", style: TextStyle(color: Colors.black),),
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
        )
      ),
      body: ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Image.asset(myData[index].image),
                title: Text(myData[index].nama),
                subtitle: Text(myData[index].pesan, maxLines: 1, overflow: TextOverflow.ellipsis,),
                trailing: Text(myData[index].waktu),
                onTap: () {
                  
                },
              ),
              Divider(color: Colors.black, thickness: 0.2,)
            ],
          );
        },
      ),
    );
  }
}
