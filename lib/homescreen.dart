// ignore_for_file: unused_import

import 'package:eblya_s_mujchinami/datainput.dart';
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
                  color: const Color.fromARGB(255, 22, 134, 73),
                  child: ListTile(
                    title: Text(data.text),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever_rounded),
                      onPressed: () {
                        Provider.of<MyDataProvider>(context, listen: false)
                            .deleteData(data.id);
                      },
                    ),
                    subtitle: Row(
                      children: [
                        Text(data.date),
                        Text(data.timeH),
                        Text(data.timeM),
                      ],
                    ),
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
