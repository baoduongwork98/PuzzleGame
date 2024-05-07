// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;
import 'package:flutter/foundation.dart';

bool isSolved(List<int> board, int lv) {
  List<int> solvedList = [];
  for (int i = 1; i < lv * lv; i++) {
    solvedList.add(i);
  }
  solvedList.add(0);
  return listEquals(solvedList, board);
}
