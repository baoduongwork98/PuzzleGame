// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<int>> shuffleBoard(int lv) async {
  // Add your function code here
  //List<int> numbersList = [1, 2, 3, 4, 5, 6, 7, 0, 8];
  List<int> numbersList = [];
  for (int i = 0; i < lv * lv; i++) {
    numbersList.add(i);
  }
  numbersList.shuffle();
  return numbersList;
}
