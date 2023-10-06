// ignore_for_file: prefer_const_constructors

import 'package:eblya_s_mujchinami/datainput.dart';
import 'package:eblya_s_mujchinami/provuder228.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyDataProvider()..getData(),
      child: MaterialApp(
        title: 'Записная книжка',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 44, 221, 153)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
