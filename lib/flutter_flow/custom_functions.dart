import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<int>? initBoard(int lv) {
  List<int> numbersList = [];
  for (int i = 1; i < lv * lv; i++) {
    numbersList.add(i);
  }
  return numbersList;
}

int getIndex(
  List<int> board,
  int value,
) {
  return board.indexOf(value);
}
