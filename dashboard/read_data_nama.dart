import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetDataNama extends StatelessWidget {
  const GetDataNama({super.key, required this.docId});
  final String docId;
  @override
  Widget build(BuildContext context) {
    CollectionReference produk = FirebaseFirestore.instance.collection('produk');

    return FutureBuilder<DocumentSnapshot>(
      future: produk.doc(docId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = 
            snapshot.data!.data() as Map<String, dynamic>;
          return Text(data['nama'], style: TextStyle(fontSize: 22),);
        }
        return Text("loading...");
      }),
    );
  }
}