// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, unused_import

import 'package:eblya_s_mujchinami/baza.dart';
import 'package:eblya_s_mujchinami/main.dart';
import 'package:eblya_s_mujchinami/provuder228.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'homescreen.dart';

class EditDataForm extends StatefulWidget {
  final Baza data;
  const EditDataForm({Key? key, required this.data}) : super(key: key);

  @override
  _EditDataFormState createState() => _EditDataFormState();
}

class _EditDataFormState extends State<EditDataForm> {
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
    final dataNew = Baza(
            text: text,
            timeH: timeH,
            timeM: tImeM,
            date: date,
            id: widget.data.id)
        .toMap();
    Provider.of<MyDataProvider>(context, listen: false)
        .editData(widget.data.id ?? 0, dataNew);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Редактирование заметки")),
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
                decoration: InputDecoration(
                  labelText: widget.data.date,
                ),
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
                    decoration: InputDecoration(
                      labelText: widget.data.date.toString(),
                    ),
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
                    decoration: InputDecoration(
                      labelText: widget.data.timeM,
                    ),
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
                decoration: InputDecoration(
                  labelText: widget.data.text,
                ),
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
