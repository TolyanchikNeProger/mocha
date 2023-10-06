// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, unused_import

import 'package:eblya_s_mujchinami/baza.dart';
import 'package:eblya_s_mujchinami/main.dart';
import 'package:eblya_s_mujchinami/provuder228.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'homescreen.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _dateController = TextEditingController();
  final _timeControllerHo = TextEditingController();
  final _timeControllerMi = TextEditingController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _timeControllerHo.dispose();
    _dateController.dispose();
    _timeControllerMi.dispose();
    super.dispose();
  }

  void _submitForm() {
    final text = _textController.text.trim();
    final timeH = _textController.text.trim();
    final tImeM = _textController.text.trim();
    final date = _textController.text.trim();
    final data = Baza(
      text: text,
      timeH: timeH,
      timeM: tImeM,
      date: date,
    );
    Provider.of<MyDataProvider>(context, listen: false).addData(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Создание заметки")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: _dateController,
                decoration:
                    const InputDecoration(hintText: "Дата (дд.мм.гггг)"),
                maxLength: 10,
                keyboardType: TextInputType.datetime,
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
                    textInputAction: TextInputAction.next,
                    maxLength: 2,
                    keyboardType: TextInputType.datetime,
                    controller: _timeControllerHo,
                    decoration: const InputDecoration(hintText: "Часы..."),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 125,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    maxLength: 2,
                    keyboardType: TextInputType.datetime,
                    controller: _timeControllerMi,
                    decoration: const InputDecoration(hintText: "Минуты..."),
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
                _submitForm();
              },
              child: const Text("Сохранить"),
            )
          ],
        ),
      ),
    );
  }
}
// color: const Color.fromARGB(255, 29, 226, 118),

// FloatingActionButton(
              // onPressed: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => MyHomePage(
              //               date: _dateController.text,
              //               time: _timeController.text,
              //               text: _TextController.text,
              //               col1: const Color.fromARGB(255, 29, 226, 118))));
              // },
              // child: const Icon(Icons.add),
//             ),



// DateTime dateTime = DateTime(year, month, day, hour, minutes);
//   String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime)  
//   String formattedTime = DateFormat("HH:mm").format(dateTime);
  