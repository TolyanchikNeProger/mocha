// ignore_for_file: unused_import

import 'package:eblya_s_mujchinami/datainput.dart';
import 'package:eblya_s_mujchinami/editdata.dart';
import 'package:eblya_s_mujchinami/provuder228.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

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
      body: Consumer<MyDataProvider>(builder: (context, provider, child) {
        final dataList = provider.dataList.toList();
        return Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final data = dataList[index];
                return Card(
                  color: const Color.fromARGB(255, 65, 255, 151),
                  child: ListTile(
                    title: Row(
                      children: [
                        const Text("Дата:"),
                        Text(data.date),
                        const Text(" Время: "),
                        Text(data.timeH),
                        const Text(":"),
                        Text(data.timeM),
                      ],
                    ),
                    leading: IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditDataForm(data: data))),
                      icon: const Icon(Icons.edit),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_rounded),
                      onPressed: () {
                        Provider.of<MyDataProvider>(context, listen: false)
                            .deleteData(data.id);
                      },
                    ),
                    subtitle: Text(data.text),
                  ),
                );
              },
            ))
          ],
        );
      }),
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
