import 'dart:math';

import 'package:flutter/material.dart';

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({Key? key}) : super(key: key);

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

enum DataType { intType, doubleType, stringType }

class _BubbleSortPageState extends State<BubbleSortPage> {
  DataType _currentType = DataType.intType;

  String _unsortedArrayStr = 'source';
  String _sortedArrayStr = 'output';

  late List<Object> _unsortedArray;
  late List<Object> _sortedArray;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        textDirection: TextDirection.ltr,
        children: [
          Column(
            children: [
              ListTile(
                tileColor: Colors.blue,
                title: const Text('int'),
                leading: Radio<DataType>(
                  value: DataType.intType,
                  groupValue: _currentType,
                  onChanged: (DataType? value) {
                    setState(() {
                      _currentType = value!;
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
                      _currentType = value!;
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
                      _currentType = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _unsortedArrayStr,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      _randomData(_currentType);
                    },
                    child: const Text("Randomize")),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                _sort();
              },
              child: const Text("Sort")),
          Text(
            _sortedArrayStr,
          ),
        ],
      ),
    );
  } // build()

  _randomData(DataType dataType) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    setState(() {
      _unsortedArray = [];
      for (int i = 0; i < 10; i++) {
        switch (dataType) {
          case DataType.intType:
            _unsortedArray.add(Random().nextInt(30));
            break;
          case DataType.doubleType:
            _unsortedArray
                .add((Random().nextDouble() * 30).toStringAsPrecision(3));
            break;
          case DataType.stringType:
            _unsortedArray.add(getRandomString(2));
            break;
        }
      }

      _unsortedArrayStr = '';
      _sortedArrayStr = '';

      for (int i = 0; i < 10; i++) {
        _unsortedArrayStr += i == 0 ? '' : ' ';
        _unsortedArrayStr += _unsortedArray[i].toString();
      }
    });
  }

  _sort() {
    setState(() {
      _sortedArrayStr = '';

      _sortedArray = _unsortedArray;

      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 9; j++) {
          if (_sortedArray[j]
                  .toString()
                  .compareTo(_sortedArray[j + 1].toString()) ==
              1) {
            Object _temp = _sortedArray[j];
            _sortedArray[j] = _sortedArray[j + 1];
            _sortedArray[j + 1] = _temp;
          }
        }
      }

      for (int i = 0; i < 10; i++) {
        _sortedArrayStr += i == 0 ? '' : ' ';
        _sortedArrayStr += _sortedArray[i].toString();
      }
    });
  }
}
