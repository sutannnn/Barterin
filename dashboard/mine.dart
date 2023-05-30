import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/read_data_harga.dart';
import 'package:flutter_application_1/dashboard/read_data_nama.dart';
import 'datamine.dart';

class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  List<String> doc = [];

  Future getDoc() async {
    await FirebaseFirestore.instance
        .collection('produk')
        .get()
        .then((snapshot) => snapshot.docs.forEach((value) {
              print(value.reference);
              doc.add(value.reference.id);
            }));
  }
  void initState(){
    getDoc();
    super.initState();
  }

  bool? check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
      future: getDoc(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: doc.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      activeColor: Color.fromRGBO(255, 145, 16, 1),
                      //only check box
                      value: check, //unchecked
                      onChanged: (bool? value) {
                        //value returned when checkbox is clicked
                        setState(() {
                          check = value;
                        });
                      }),
                  Container(
                    width: 110,
                    height: 110,
                    child: Image.asset('images/rubik.png'),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black38)
                    // ),
                  ),
                  SizedBox(width: 10),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetDataNama(docId: doc[index]),
                        GetDataHarga(docId: doc[index])
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ));
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
