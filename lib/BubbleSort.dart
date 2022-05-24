import 'dart:math';

import 'package:flutter/material.dart';

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({Key? key}) : super(key: key);

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

enum DataType {
  intType,
  doubleType,
  stringType
}

class _BubbleSortPageState extends State<BubbleSortPage> {

  int dataType = 0;

  DataType? _currentType = DataType.intType;

  String _unsortedArray = 'source';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            Column(
              children:
              [
                ListTile(
                  tileColor: Colors.blue,
                  title: const Text('int'),
                  leading: Radio<DataType>(
                    value: DataType.intType,
                    groupValue: _currentType,
                    onChanged: (DataType? value) {
                      setState(() {
                        _currentType = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  tileColor: Colors.lime,
                  title: const Text('double'),
                  leading: Radio<DataType>(
                    value: DataType.doubleType,
                    groupValue: _currentType,
                    onChanged: (DataType? value) {
                      setState(() {
                        _currentType = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  tileColor: Colors.orange,
                  title: const Text('string'),
                  leading: Radio<DataType>(
                    value: DataType.stringType,
                    groupValue: _currentType,
                    onChanged: (DataType? value) {
                      setState(() {
                        _currentType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                    _unsortedArray,
                ),
                ElevatedButton(
                    onPressed: _randomData(dataType),
                    child: const Text("Randomize")
                )
              ],
            ),
            ElevatedButton(
                onPressed: _sort(),
                child: const Text("Sort")
            ),
            const Text(
                "Output"
            ),
          ],
        ),
    );
  } // build()

  _randomData(int dataType) {
    setState(() {
      _unsortedArray = Random().nextInt(100).toString();
    });
    //throw Exception();
  }

  _sort() {

  }
}
