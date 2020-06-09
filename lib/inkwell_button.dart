import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  final String text;
  final Function onTapped;

  InkWellButton({@required this.text, @required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
//      () {
//        setState(() {
//          _personCounter++;
//        });
//      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.grey.withOpacity(.1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    );
  }
}
