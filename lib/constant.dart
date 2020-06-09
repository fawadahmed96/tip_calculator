import 'package:flutter/material.dart';

const kTotalPerson = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.purple);

const kPerPersonAmount = TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold);

final kContainer1 = BoxDecoration(
  color: Color(0xFF6908D6).withOpacity(.1),
  borderRadius: BorderRadius.circular(12.0),
);

final kContainer2 = BoxDecoration(
  color: Colors.transparent,
  border: Border.all(color: Colors.blueGrey.shade100, style: BorderStyle.solid),
  borderRadius: BorderRadius.circular(12.0),
);
