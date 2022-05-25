import 'dart:math';

import 'package:flutter/material.dart';

/// Сортировка пузырьком
class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({Key? key}) : super(key: key);

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

/// Доступные типы данных
enum DataType { intType, doubleType, stringType }

class _BubbleSortPageState extends State<BubbleSortPage> {
  DataType _currentType = DataType.intType;

  /// Строки, которые отображаются на экране
  String _unsortedStr = 'source';
  String _sortedStr = 'output';

  /// Контейнеры со значениями
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
                _unsortedStr,
              ),
              SizedBox(
                width: 110,
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
                _sort(_currentType);
              },
              child: const Text("Sort")),
          Text(
            _sortedStr,
          ),
        ],
      ),
    );
  } // build()

  /// Генерация сета данных
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

      _unsortedStr = '';
      _sortedStr = '';

      for (int i = 0; i < 10; i++) {
        _unsortedStr += i == 0 ? '' : ' ';
        _unsortedStr += _unsortedArray[i].toString();
      }
    });
  }

  /// Сортировка для 3 типов данных
  _sort(DataType _currentType) {
    setState(() {
      _sortedStr = '';

      _sortedArray = _unsortedArray;

      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 9; j++) {
          switch (_currentType) {
            case DataType.intType:
              if (int.parse(_sortedArray[j].toString()) >
                  int.parse(_sortedArray[j + 1].toString())) {
                Object _temp = _sortedArray[j];
                _sortedArray[j] = _sortedArray[j + 1];
                _sortedArray[j + 1] = _temp;
              }
              break;
            case DataType.doubleType:
              if (double.parse(_sortedArray[j].toString()) >
                  double.parse(_sortedArray[j + 1].toString())) {
                Object _temp = _sortedArray[j];
                _sortedArray[j] = _sortedArray[j + 1];
                _sortedArray[j + 1] = _temp;
              }
              break;
            case DataType.stringType:
              if (_sortedArray[j]
                      .toString()
                      .compareTo(_sortedArray[j + 1].toString()) ==
                  1) {
                Object _temp = _sortedArray[j];
                _sortedArray[j] = _sortedArray[j + 1];
                _sortedArray[j + 1] = _temp;
              }
              break;
          }
        }
      }

      for (int i = 0; i < 10; i++) {
        _sortedStr += i == 0 ? '' : ' ';
        _sortedStr += _sortedArray[i].toString();
      }
    });
  }
}
