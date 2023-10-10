import 'package:flutter/material.dart';
import 'baza.dart';
import 'datahelper.dart';

class MyDataProvider extends ChangeNotifier {
  List _dataList = [];

  List get dataList => _dataList;

  void getData([DateTime? selectedDate]) async {
    final dataList = await DatabaseHelper.instance.getData(selectedDate);
    _dataList = dataList;
    notifyListeners();
  }

  void addData(Baza data) async {
    final id = await DatabaseHelper.instance.insertData(data);
    final newData = data.copyWith(id: id);
    _dataList.add(newData);
    notifyListeners();
  }

  void deleteData(int id) async {
    await DatabaseHelper.instance.deleteData(id);
    getData();
  }

  void editData(int id, Map<String, dynamic> newData) async {
    await DatabaseHelper.instance.editData(id, newData);
    getData();
  }
}
