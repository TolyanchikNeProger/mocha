import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Baza {
  final int? id;
  final String text;
  final DateTime date;
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
      'date': DateFormat('yyyy-MM-dd').format(date),
      'timeM': text,
      'timeH': text,
    };
  }

  factory Baza.fromMap(Map<String, dynamic> map) {
    return Baza(
      id: map['id'],
      text: map['text'],
      date: DateTime.parse(map['date']),
      timeH: map['timeH'],
      timeM: map['timeM'],
    );
  }
}
