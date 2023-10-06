// ignore_for_file: unnecessary_string_interpolations

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
  final _TextController = TextEditingController();
  DateTime _segodnyaData = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _segodnyaData,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _segodnyaData) {
      setState(
        () {
          _segodnyaData = picked;
          _dateController.text = DateFormat('yyyy-MM-dd').format(_segodnyaData);
        },
      );
    }
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
                controller: _dateController,
                decoration: const InputDecoration(hintText: "Дата..."),
                onTap: () => _selectDate(context),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  child: TextField(
                    controller: _timeControllerHo,
                    decoration: const InputDecoration(hintText: "Часы..."),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: TextField(
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
                controller: _TextController,
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
                        builder: (context) => MyHomePage(
                            date: _dateController.text,
                            timeH: _timeControllerHo.text,
                            timeM: _timeControllerMi.text,
                            text: _TextController.text,
                            col1: const Color.fromARGB(255, 29, 226, 118))));
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
  