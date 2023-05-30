// import 'package:flutter/widgets.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Auth with ChangeNotifier {
//   void signUP(String email, String sandi) async {
//     Uri url = Uri.parse(
//         "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDgnab31Sobi-B3wK-dr_QCnLiNGn5nDRw");

//     var response = await http.post(url,
//         body: json.encode(
//             {"email": email, "sandi": sandi, "returnSecureToken": true}));
//   }
// }
