import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/atributs/mybutton.dart';
import '../atributs/mytextfield.dart';
import 'home.dart';

class TambahBarang extends StatefulWidget {
  TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  TextEditingController _kategori = TextEditingController();
  TextEditingController _nama = TextEditingController();
  TextEditingController _deskripsi = TextEditingController();
  TextEditingController _harga = TextEditingController();

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadProduk() async {
    final path = 'files/${pickedFile!.path!}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download link: $urlDownload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Tambah Barang",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Foto Prdouk",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(255, 145, 16, 1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              selectFile();
                            },
                            child: Icon(
                              Icons.add_a_photo,
                              color: Color.fromRGBO(255, 145, 16, 1),
                              size: 25,
                            ),
                          ),
                          pickedFile == null
                              ? Text(
                                  "Foto(0/1)",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 145, 16, 1),
                                      fontSize: 11),
                                )
                              : Text(
                                  "Foto(1/1)",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 145, 16, 1),
                                      fontSize: 11),
                                )
                        ],
                      ),
                    ),
                  ),
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
                      onPressed: uploadProduk,
                      child: Text(
                        "Upload Foto",
                        style: TextStyle(fontSize: 12),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(110, 25),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Video Prdouk",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Color.fromRGBO(255, 145, 16, 1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              selectFile();
                            },
                            child: Icon(
                              Icons.video_call,
                              color: Color.fromRGBO(255, 145, 16, 1),
                              size: 25,
                            ),
                          ),
                          pickedFile == null
                              ? Text(
                                  "Video(0/1)",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 145, 16, 1),
                                      fontSize: 11),
                                )
                              : Text(
                                  "Video(1/1)",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 145, 16, 1),
                                      fontSize: 11),
                                )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                      "- Ukuran: Maks. 30 MB\n- Durasi: 10-60 detik\n- Format: MP4")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Nama Prdouk",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  MyTF(
                    txt: "Nama Produk",
                    inpType: TextInputType.text,
                    width: 276,
                    height: 46,
                    tr: 8,
                    tl: 8,
                    br: 8,
                    bl: 8,
                    fs: 15,
                    ot: false,
                    controller: _nama,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Harga Prdouk",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  MyTF(
                    txt: "Harga",
                    inpType: TextInputType.text,
                    width: 276,
                    height: 46,
                    tr: 8,
                    tl: 8,
                    br: 8,
                    bl: 8,
                    fs: 15,
                    ot: false,
                    controller: _harga,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Kategori",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  MyTF(
                    txt: "Kategori",
                    inpType: TextInputType.text,
                    width: 276,
                    height: 46,
                    tr: 8,
                    tl: 8,
                    br: 8,
                    bl: 8,
                    fs: 15,
                    ot: false,
                    controller: _kategori,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Deskripsi",
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 75,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                          controller: _deskripsi,
                          minLines: 2,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                "Deskripsi",
                                style: TextStyle(color: Colors.black38),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(214, 214, 214, 1)),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(214, 214, 214, 1)),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              )))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                        borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('produk')
                              .add({
                                'nama': _nama.text,
                                'harga': _harga.text,
                                'kategori': _kategori.text,
                                'deskripsi': _deskripsi.text,
                              }).then((value){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
                              });
                        },
                        child: Text(
                          "Simpan & Tampilkan",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(110, 25),
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
      ),
    );
  }
}
