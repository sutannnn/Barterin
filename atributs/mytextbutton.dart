// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MytextButton extends StatefulWidget {
  const MytextButton({
    Key? key,
    required this.txt,
    required this.cls,
    required this.clr,
    required this.fs,
    required this.fw,
    required this.td,
  }) : super(key: key);

  final String txt;
  final Widget cls;
  final Color clr;
  final double fs;
  final FontWeight fw;
  final TextDecoration td;

  @override
  State<MytextButton> createState() =>
      _MytextButtonState(txt, cls, clr, fs, fw, td);
}

class _MytextButtonState extends State<MytextButton> {
  _MytextButtonState(this.txt, this.cls, this.clr, this.fs, this.fw, this.td);

  final String txt;
  final Widget cls;
  final Color clr;
  final double fs;
  final FontWeight fw;
  final TextDecoration td;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => cls));
      },
      child: Text(txt),
      style: TextButton.styleFrom(
          primary: clr,
          textStyle: TextStyle(
            fontSize: fs,
            fontWeight: fw,
            decoration: td,
          )),
    );
  }
}
