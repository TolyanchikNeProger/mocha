// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Baza {
  final int? id;
  final String text;
  final String date;
  final String timeH;
  final String timeM;

  Baza({
    this.id,
    required this.text,
    required this.date,
    required this.timeH,
    required this.timeM,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'date': text,
      'timeM': text,
      'timeH': text,
    };
  }

  factory Baza.fromMap(Map<String, dynamic> map) {
    return Baza(
      id: map['id'],
      text: map['text'],
      date: map['date'],
      timeH: map['timeH'],
      timeM: map['timeM'],
    );
  }
  Baza copyWith({
    int? id,
    String? text,
    String? timeH,
    String? timeM,
    String? date,
    int? number,
  }) {
    return Baza(
      id: id ?? this.id,
      text: text ?? this.text,
      timeH: timeH ?? this.timeH,
      timeM: timeM ?? this.timeM,
      date: date ?? this.date,
    );
  }
}
