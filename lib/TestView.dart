import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;
import 'reklama.dart';
import 'table_data.dart';
import 'dart:math';

//список разных цветов
final List<Color> colors = [ // Добавляем массив цветов
  Colors.black,
  Colors.white,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.grey,

  Colors.orange,
  Colors.brown,
  Colors.purple,
  Colors.red[100]!,
  Colors.green[100]!,
  Colors.yellow[100]!,
  Colors.blue[100]!,

  Colors.orange[100]!,
  Colors.brown[100]!,
  Colors.purple[100]!,
  Colors.red[300]!,
  Colors.green[300]!,
  Colors.yellow[300]!,
  Colors.blue[300]!,

  Colors.orange[300]!,
  Colors.brown[300]!,
  Colors.purple[300]!,
  Colors.grey[300]!,
  Colors.black45,
  Colors.black26,
  Colors.white10,
];

//функция берет уникальные окончания из массива и перемешивает возвращая массив
List<String> getUniqueEndings(List<List<String>> correctEndings) {
  Set<String> uniqueEndings = {}; // Используем Set для уникальности
  // Проходим по массиву, исключая первую строку и первый столбец
  for (int i = 1; i < correctEndings.length; i++) {
    for (int j = 1; j < correctEndings[i].length; j++) {
      uniqueEndings.add(correctEndings[i][j]); // Добавляем в Set
    }
  }
  List<String> endings = uniqueEndings.toList(); // Преобразуем Set в List
  endings.shuffle(Random()); // Перемешиваем
  return endings;
}






//отображение таблицы со всей логикой и передачей в нее парамаметров для работы
class TestView extends StatefulWidget {
  const TestView({
    super.key,
    required this.correctEndings,
    required this.adviceShort,
    required this.tableRowHeight,
    required this.tableQuarterTurns,
  });
  final List<List<String>> correctEndings;
  final List<List<String>> adviceShort;
  final double tableRowHeight;
  final int tableQuarterTurns;

  @override
  State<TestView> createState() => _TestViewState();
}

//сам класс для отображения теста
class _TestViewState extends State<TestView> {


  //переменных блок

  //final List<List<String>> correctEndings;
  //final List<List<String>> adviceShort;
  //final double tableRowHeight;
  //final int tableQuarterTurns;

  late TableData table;
  late List<String> valEndings; //сюда записываем уникальные варианты ответов

  bool _isSmallHintsEnabled = false; // Малая подсказка
  bool _isStrongHintsEnabled = false; // Грубая подсказка



 // _TestViewState(this.correctEndings, this.adviceShort,this.tableRowHeight,this.tableQuarterTurns);//описываем принимаемые значения

//у StatefulWidget жизненный цикл и  initState то что выполняется при его рождение. однократная иницилизация
  @override
  void initState() {
    super.initState();
    _initializeData();

    //valEndings = getUniqueEndings(correctEndings); //используем функцию для получения уникальных вариантов ответов
    //table = TableData(correctEndings);  //  формируем таблицу по обновленной

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView(
      children: <Widget>[

        GalotneTableWidget(table: table, showDialog: _showEndingsDialog, rowHeight: widget.tableRowHeight, quarterTurns: widget.tableQuarterTurns),


        //кнропка и два типа подсказок
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            ElevatedButton(
              onPressed: _checkAnswers,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,

              ),
              child: const Text('Pārbaudiet'),
            ),

            Switch(
              value: _isSmallHintsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isSmallHintsEnabled = value;
                  if (_isSmallHintsEnabled) {
                    _showHintsTapDown();
                  }else{
                    _showHintsTapUp();
                  }
                });
              },
            ),

            Switch(
              value: _isStrongHintsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isStrongHintsEnabled = value;
                  if (_isStrongHintsEnabled) {
                    _showStrongHints();
                  }else{
                    _showHintsTapUp();
                  }
                });
              },
            ),



          ],
        ),

        AdvertisementWidget(),

      ],
    ),
    );
  }

  void didUpdateWidget(covariant TestView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если данные поменялись — переинициализируем
    if (oldWidget.correctEndings != widget.correctEndings) {
      _initializeData();
    }
  }

  void _initializeData() {
    valEndings = getUniqueEndings(widget.correctEndings);
    table = TableData(widget.correctEndings);
  }

  //всплывающее окно после нажатий на ячейки
  void _showEndingsDialog(BuildContext context, int rowIndex, int columnIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: Text(widget.adviceShort[rowIndex][columnIndex]),
          titleTextStyle: const TextStyle( // Добавляем titleTextStyle
            fontSize: 16,  // Изменяем размер шрифта
            fontWeight: FontWeight.bold, // Делаем жирным
            color: Colors.blue, // Изменяем цвет шрифта
            fontFamily: 'Roboto', // Изменяем семейство шрифта
          ),
          content:(rowIndex == 0 && columnIndex == 0)
              ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Services.Clipboard.setData(const Services.ClipboardData(
                      text: 'LV13HABA0551053528651')); // Services.Clipboard

                  Navigator.of(context).pop();
                },
                child: const Text('Nopērc man kafiju'),
              ),
            ],
          )
              : (rowIndex > 0 && columnIndex > 0)
              ? SizedBox(
            width: 250,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 4,
              runSpacing: 4,
              children: valEndings.map((ending) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      table.rows[rowIndex][columnIndex].chouse_text = ending;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 80, // ширина одной ячейки
                    height: 45, // высота одной ячейки
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),

                    ),
                    child: Text(style:TextStyle(fontSize: calculateFontSize(ending)) ,   ending),



                  ),
                );
              }).toList(),
            ),

          )    : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aizveriet'),
              ),
            ],
          ),
        );
      },
    );
  }

  //функция проверки ответов
  void _checkAnswers() {
    setState(() {
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {
            if (cell.chouse_text == "") {
              cell.color = Colors.grey[200];
            } else if (cell.chouse_text == cell.correct_text) {
              cell.color = Colors.green[200];
            } else {
              cell.color = Colors.red[200];
            }
          }
        }
      }
    });
  }


//функция для показа подсказок а фактичкски ответов
  void _showStrongHints() {
    setState(() {
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {
            if (cell.chouse_text == "" || cell.chouse_text != cell.correct_text) {
              cell.color = Colors.yellow[200];
              cell.chouse_text=cell.correct_text;
              cell.isShows = true;
            }else{
              cell.color = Colors.green[200];
              cell.isShows = false;


            }
          }
        }
      }
    });
  }

//функция  показать цветные подсказки
  void _showHintsTapDown() {

    setState(() {
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {

            int correctIndex = widget.correctEndings.indexWhere((element) => element.contains(cell.correct_text)); // Получаем индекс
            if(correctIndex >= 0){ // Проверяем найден ли индекс
              int valIndex = valEndings.indexOf(cell.correct_text);
              if(valIndex >= 0) { // Проверяем найден ли индекс
                cell.color = colors[valIndex % colors.length];
              }
            } else if (cell.chouse_text == cell.correct_text ) {
              cell.color = Colors.green[200];
            } else {
              cell.color = Colors.red[200];
            }
          }
        }
      }
    });



  }

  // функция убрать подсказки
  void _showHintsTapUp() {
    setState(() {
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {
            if(cell.isShows) {
              cell.chouse_text="";
              cell.isShows = false;
            }
            //if (cell.chouse_text == "") {
            cell.color = Colors.grey[200];
            // }
          }
        }
      }
    });


  }

}