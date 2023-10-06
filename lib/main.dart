// ignore_for_file: prefer_const_constructors

import 'package:eblya_s_mujchinami/datainput.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Записная книжка',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 44, 221, 153)),
      ),
      home: MyHomePage(
          date: "",
          timeH: "",
          timeM: "",
          text: "",
          col1: Color.fromARGB(255, 24, 184, 96)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.date,
    required this.timeH,
    required this.timeM,
    required this.text,
    required this.col1,
  });

  final String date;
  final String timeH;
  final String timeM;
  final String text;
  final Color col1;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 184, 96),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ваши заметки"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyWidget()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
// Container(
//               decoration: BoxDecoration(
//                   color: widget.col1,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                   border: Border.all(width: 1, color: widget.col1)),
//               width: 150.0,
//               height: 20.0,
//               child: Text(
//                 textAlign: TextAlign.center,
//                 widget.date,
//                 style: const TextStyle(
//                     color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Arial'),
//               ),
//             ),
//             Container(
//               width: 150.0,
//               height: 20.0,
//               color: widget.col1,
//               child: Text(
//                 textAlign: TextAlign.center,
//                 widget.time,
//                 style: const TextStyle(
//                     color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Arial'),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: widget.col1,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                   border: Border.all(width: 1, color: widget.col1)),
//               width: 150.0,
//               height: 100.0,
//               child: Text(
//                 textAlign: TextAlign.center,
//                 widget.text,
//                 style: const TextStyle(
//                     color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Arial'),
//               ),
//             ),
//           ],
//         ),
//         Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//           Container(
//             color: widget.col1,
//             width: 150.0,
//             height: 140.0,
//           )