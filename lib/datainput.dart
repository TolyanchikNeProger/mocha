// ignore_for_file: unnecessary_string_interpolations

import 'package:eblya_s_mujchinami/homescreen.dart';
import 'package:eblya_s_mujchinami/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _dateController = TextEditingController();
  final _timeControllerHo = TextEditingController();
  final _timeControllerMi = TextEditingController();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Создание заметки")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
            width: 250,
            child: TextField(
              keyboardType: TextInputType.datetime,
              controller: _dateController,
              decoration: const InputDecoration(hintText: "Дата (дд.мм.гггг)"),
              textInputAction: TextInputAction.next,
              maxLength: 8,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 125,
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  controller: _timeControllerHo,
                  decoration: const InputDecoration(hintText: "Часы (00-24)"),
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                ),
              ),
              SizedBox(
                height: 50,
                width: 125,
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  controller: _timeControllerMi,
                  decoration: const InputDecoration(hintText: "Минуты..."),
                  textInputAction: TextInputAction.next,
                  maxLength: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 50,
            width: 250,
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: "Текст заметки..."),
              maxLength: 100,
              textInputAction: TextInputAction.done,
            ),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            child: const Text("Сохранить"),
          )
        ],
      ),
    );
  }
}
// color: const Color.fromARGB(255, 29, 226, 118),

// DateTime dateTime = DateTime(year, month, day, hour, minutes);
//   String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime)  
//   String formattedTime = DateFormat("HH:mm").format(dateTime);
  