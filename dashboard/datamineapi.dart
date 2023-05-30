import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpMine {
  String nama, kategori, deskripsi;
  int harga;

  HttpMine({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    // required this.createdAt,
    // required this.id,
    required this.harga,
  });

  static connectAPI(
      String nama, String kategori, String deskripsi, int harga) async {
    var url = Uri.parse("http://10.219.102.39:8000/barterin");

    var response = await http.post(url, body: jsonEncode({
      "nama": nama,
      "harga": harga,
      "kategori": kategori,
      "deskripsi": deskripsi,
    }));

    var data = json.decode(json.encode(response.body));
    print(data);
    // return HttpMine(
    //     nama: data["nama"],
    //     kategori: data["kategori"],
    //     deskripsi: data["deskripsi"],
    //     // createdAt: data["createdAt"],
    //     // id: data["id"],
    //     harga: data["harga"]);
  }
}
