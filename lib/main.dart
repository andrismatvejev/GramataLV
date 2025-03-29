import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;
import 'table_data.dart';
import 'dart:math';
import 'dart:async'; // Добавляем импорт


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Services.SystemChrome.setPreferredOrientations([ // Используем алиас Services
    Services.DeviceOrientation.portraitUp, // Используем алиас Services
    Services.DeviceOrientation.portraitDown, // Используем алиас Services
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galotnes App',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Цвет фона
            foregroundColor: Colors.white, // Цвет текста
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Внутренние отступы
            textStyle: const TextStyle(fontSize: 18), // Стиль текста
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Скругление углов
            ),
          ),
        ),


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: 'Galotnes lietvārds'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Timer? _longPressTimer;
  bool _showHints = false; // Флаг для показа подсказок
  bool _isHintButtonPressed = false;

  late TableData table;
  late final List<String> valEndings;
  final adviceShort = const <List<String>>[
    [" ",
      "1. deklinācija.\nPirmajai deklinācijai pieder vīriešu dzimtes lietvārdi ar galotni -s vai -š vienskaitļa nominatīvā. Tie ir bieži lietoti vārdi, piemēram: tēvs, galds, draugs. Locās visos locījumos.",
      "2. deklinācija.\nOtrajai deklinācijai pieder vīriešu dzimtes lietvārdi ar galotni -is vienskaitļa nominatīvā. Piemēri: skapis, skolnieks, akmens. Dažiem vārdiem ir īpašas locīšanas formas, īpaši daudzskaitlī.",
      "3. deklinācija.\nTrešajai deklinācijai pieder vīriešu dzimtes lietvārdi ar galotni -us vienskaitļa nominatīvā. Tie parasti ir senlatviešu vai īpaši vārdi: tirgus, medus, ledus. Locīšana var būt neregulāra.",
      "4. deklinācija.\nCeturtajai deklinācijai pieder sieviešu dzimtes lietvārdi ar galotni -a vienskaitļa nominatīvā. Šī ir visbiežāk lietotā deklinācija. Piemēri: mamma, grāmata, valoda. Locās visos locījumos.",
      "5. deklinācija.\nPiektajai deklinācijai pieder sieviešu dzimtes lietvārdi ar galotni -e vienskaitļa nominatīvā. Piemēri: upe, meitene, pilsēta. Dažiem vārdiem daudzskaitlī var mainīties saknes burts.",
      "6. deklinācija.\nSestajai deklinācijai pieder īpaši sieviešu dzimtes vārdi ar galotni -s nominatīvā. Tie ir reti un bieži tikai daudzskaitlī: asinis, debesis, brokastis. Locās daļēji kā daudzskaitlis."],
          ["Nominatīvs (vienskaitlis)\nNominatīvs atbild uz jautājumiem kas? (kas tas ir?). To lieto, lai nosauktu teikuma priekšmetu vai runas sākuma punktu. Piemēri: meitene lasa, skolotājs stāsta, koks aug. Tā ir vārdnīcas forma.",
      "D1 Viriešu Vienskaitlis Nominatīvs",    "D2 Viriešu Vienskaitlis Nominatīvs",   "D3 Viriešu Vienskaitlis Nominatīvs",   "D4 Sieviešu Vienskaitlis Nominatīvs",    "D5 Sieviešu Vienskaitlis Nominatīvs",    "D6 Sieviešu Vienskaitlis Nominatīvs"],
          ["Ģenitīvs (vienskaitlis)\nĢenitīvs atbild uz jautājumu kā? (kā cilvēka?). To lieto, lai izteiktu piederību, daļu no veseluma vai īpašību. Piemēri: grāmatas vāks, drauga viedoklis, mājas durvis. Bieži sastopams pie īpašības vārdiem un lietvārdu savienojumiem.",
      "D1 Viriešu Vienskaitlis Ģenitīvs",    "D2 Viriešu Vienskaitlis Ģenitīvs",   "D3 Viriešu Vienskaitlis Ģenitīvs",   "D4 Sieviešu Vienskaitlis Ģenitīvs",    "D5 Sieviešu Vienskaitlis Ģenitīvs",    "D6 Sieviešu Vienskaitlis Ģenitīvs"],
          ["Datīvs (vienskaitlis)\nDatīvs atbild uz jautājumu kam? To lieto, lai norādītu saņēmēju, labuma vai mērķa adresātu. Piemēri: es dodu dāvanu māsai, rakstu vēstuli tētim. Lieto arī ar dažiem darbības vārdiem un konstrukcijām ar vajag, patīk, sāp.",
      "D1 Viriešu Vienskaitlis Datīvs",    "D2 Viriešu Vienskaitlis Datīvs",   "D3 Viriešu Vienskaitlis Datīvs",   "D4 Sieviešu Vienskaitlis Datīvs",    "D5 Sieviešu Vienskaitlis Datīvs",    "D6 Sieviešu Vienskaitlis Datīvs"],
          ["Akuzatīvs / Instrumentālis (vienskaitlis)\nAkuzatīvs atbild uz jautājumu ko?, instrumentālis – ar ko?. Akuzatīvu lieto tiešiem objektiem: es redzu kaķi. Instrumentāli – līdzekļa vai sabiedrības norādei: rakstu ar pildspalvu, eju ar draugu. Bieži kopā ar prievārdiem.",
      "D1 Viriešu Vienskaitlis Akuzatīvs",    "D2 Viriešu Vienskaitlis Akuzatīvs",   "D3 Viriešu Vienskaitlis Akuzatīvs",   "D4 Sieviešu Vienskaitlis Akuzatīvs",    "D5 Sieviešu Vienskaitlis Akuzatīvs",    "D6 Sieviešu Vienskaitlis Akuzatīvs"],
          ["Lokatīvs (vienskaitlis)\nLokatīvs atbild uz jautājumiem kur?, kad?, par ko? To lieto, lai izteiktu vietu, laiku vai domu priekšmetu. Piemēri: grāmatā ir attēli, esmu darbā, domāju par tevi. Parasti kopā ar prievārdiem vai darbības vārdiem.",
      "D1 Viriešu Vienskaitlis Lokatīvs",    "D2 Viriešu Vienskaitlis Lokatīvs",   "D3 Viriešu Vienskaitlis Lokatīvs",   "D4 Sieviešu Vienskaitlis Lokatīvs",    "D5 Sieviešu Vienskaitlis Lokatīvs",    "D6 Sieviešu Vienskaitlis Lokatīvs"],
          ["Nominatīvs (daudzskaitlis)\nNominatīva daudzskaitļa forma atbild uz jautājumu kas? un apzīmē vairākus priekšmetus vai būtības. To lieto kā teikuma priekšmetu. Piemēri: skolēni mācās, grāmatas stāv plauktā. Tā ir vārda pamatforma daudzskaitlī.",
      "D1 Viriešu Daudzskaitlis Nominatīvs",    "D2 Viriešu Daudzskaitlis Nominatīvs",   "D3 Viriešu Daudzskaitlis Nominatīvs",   "D4 Sieviešu Daudzskaitlis Nominatīvs",    "D5 Sieviešu Daudzskaitlis Nominatīvs",    "D6 Sieviešu Daudzskaitlis Nominatīvs"],
          ["Ģenitīvs (daudzskaitlis)\nĢenitīvs daudzskaitlī atbild uz jautājumu kā? un izsaka piederību vai daļu no vairākiem objektiem. Piemēri: draugu viedokļi, skolēnu burtnīcas, koku lapas. Bieži lietots ar īpašības vārdiem un daudzuma izteiksmēm.",
      "D1 Viriešu Daudzskaitlis Ģenitīvs",    "D2 Viriešu Daudzskaitlis Ģenitīvs",   "D3 Viriešu Daudzskaitlis Ģenitīvs",   "D4 Sieviešu Daudzskaitlis Ģenitīvs",    "D5 Sieviešu Daudzskaitlis Ģenitīvs",    "D6 Sieviešu Daudzskaitlis Ģenitīvs"],
          ["Datīvs (daudzskaitlis)\nDatīvs daudzskaitlī atbild uz jautājumu kam? un norāda uz vairākiem saņēmējiem. To lieto ar darbības vārdiem un konstrukcijām, kur nepieciešama adresāta forma. Piemēri: dod bērniem, stāsta vecākiem, sāp kājām.",
      "D1 Viriešu Daudzskaitlis Datīvs",    "D2 Viriešu Daudzskaitlis Datīvs",   "D3 Viriešu Daudzskaitlis Datīvs",   "D4 Sieviešu Daudzskaitlis Datīvs",    "D5 Sieviešu Daudzskaitlis Datīvs",    "D6 Sieviešu Daudzskaitlis Datīvs"],
          ["Akuzatīvs / Instrumentālis (daudzskaitlis)\nAkuzatīvs daudzskaitlī atbild uz ko?, bet instrumentālis – ar ko?. Piemēri: redz skolēnus, pērk ziedus, runā ar draugiem, ceļo ar bērniem. Bieži lietots ar darbības vārdiem un prievārdiem.",
      "D1 Viriešu Daudzskaitlis Akuzatīvs",    "D2 Viriešu Daudzskaitlis Akuzatīvs",   "D3 Viriešu Daudzskaitlis Akuzatīvs",   "D4 Sieviešu Daudzskaitlis Akuzatīvs",    "D5 Sieviešu Daudzskaitlis Akuzatīvs",    "D6 Sieviešu Daudzskaitlis Akuzatīvs"],
          ["Lokatīvs (daudzskaitlis)\nLokatīvs daudzskaitlī atbild uz kur?, kad?, par ko? un izsaka vietu, laiku vai domu priekšmetu attiecībā uz vairākiem objektiem. Piemēri: par grāmatām, darbos, sapņos, uz galdiem. Lieto kopā ar prievārdiem.",
            "D1 Viriešu Daudzskaitlis Lokatīvs",    "D2 Viriešu Daudzskaitlis Lokatīvs",   "D3 Viriešu Daudzskaitlis Lokatīvs",   "D4 Sieviešu Daudzskaitlis Lokatīvs",    "D5 Sieviešu Daudzskaitlis Lokatīvs",    "D6 Sieviešu Daudzskaitlis Lokatīvs"],
  ];

  final correctEndings = const <List<String>>[
    ["", "D1", "D2", "D3", "D4", "D5", "D6"],
    ["N",  "s",    "is",   "us",   "a",    "e",    "s"],
    ["G",  "a",    "a",    "us",   "as",   "es",   "s"],
    ["D",  "am",   "im",   "um",   "ai",   "ei",   "ij"],
    ["AI",  "u",    "i",    "u",    "u",    "i",    "i"],
    ["L",  "ā",    "ī",    "ū",    "ā",    "ē",    "ī"],
    ["N",  "i",    "i",    "i",    "as",   "es",   "is"],
    ["G",  "u",    "u",    "u",    "u",    "u",    "u"],
    ["D",  "iem",  "iem",  "iem",  "ām",   "ēm",   "īm"],
    ["AI",  "us",   "us",   "us",   "as",   "es",   "is"],
    ["L",  "os",   "os",   "os",   "ās",   "ēs",   "īs"]
  ];


  final List<Color> colors = [ // Добавляем массив цветов
    Colors.black!,
    Colors.white!,
    Colors.green!,
    Colors.red!,
    Colors.yellow!,
    Colors.blue!,
    Colors.grey!,

    Colors.orange!,
    Colors.brown!,
    Colors.purple!,
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
    Colors.black45!,
    Colors.black26!,
    Colors.white10!,
  ];


  @override
  void initState() {
    super.initState();
    const List<String> originalEndings = ["s", "is", "us", "a", "e", "as", "es",
      "am","im", "um", "ai", "ei", "ij", "u","i", "iem","os","ū","ā","ē","ī",
      "ām","ēm","īm","ās","ēs","īs"];

    valEndings = List.of(originalEndings);
    valEndings.shuffle(Random()); // Перемешиваем
    table = TableData(correctEndings);

  }



  void _showEndingsDialog(BuildContext context, int rowIndex, int columnIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(adviceShort[rowIndex][columnIndex]),
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
            width: 200,
            height: 400,
            child:   GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 столбца
                childAspectRatio: 2,
              ),
              itemCount: valEndings.length, // Общее количество ячеек (3 * 9)
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Обновляем chouse_text в выбранной ячейке
                      table.rows[rowIndex][columnIndex].chouse_text = valEndings[index];
                    });
                    Navigator.of(context).pop(); // Закрываем диалоговое окно
                  },
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(valEndings[index]),
                    ),
                  ),
                );
              },
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


  void _startLongPressTimer() {
    _longPressTimer = Timer(const Duration(seconds: 5), () { // Устанавливаем нужное время
      _showStrongHints(); // Вызываем метод, когда таймер сработал
    });
  }

  void _cancelLongPressTimer() {
    _longPressTimer?.cancel(); // Отменяем таймер, если он запущен
    _longPressTimer = null;
  }


  void _showHintsTapDown() {

    setState(() {
      _startLongPressTimer();
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {

            int correctIndex = correctEndings.indexWhere((element) => element.contains(cell.correct_text)); // Получаем индекс
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
  void _showHintsTapUp() {
    _cancelLongPressTimer();
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
  void _showStrongHintsLongPress() {

    setState(() {
      for (var row in table.rows) {
        for (var cell in row) {
          if (!cell.isHeader) {
            if (cell.correct_text == valEndings[0]) {
              cell.color = Colors.yellow[200];
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


  void _showStrongHintsLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    //print('Show Strong Hints Move details.offsetFromOrigin.dx.abs():${details.offsetFromOrigin.dx.abs()}, details.offsetFromOrigin.dy.abs():${details.offsetFromOrigin.dy.abs()}, localOffsetFromOrigin:${details.localOffsetFromOrigin}, globalPosition:${details.globalPosition}, localPosition:${details.localPosition}');
    if(details.offsetFromOrigin.dx.abs() > 20 || details.offsetFromOrigin.dy.abs() > 20){
      _showHintsTapUp();

    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(widget.title),
            ),
            const SizedBox(width: 10), // Отступ между текстом и картинкой

          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          GalotneTableWidget(table: table, showDialog: _showEndingsDialog),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          ElevatedButton(
            onPressed: _checkAnswers,
            child: const Text('Pārbaudiet'),
          ),


            GestureDetector( // Используем GestureDetector
              onTapDown: (_) => _showHintsTapDown(), // При нажатии
              onTapUp: (_) => _showHintsTapUp(), // При отпускании
              onPanStart: (_) => _showHintsTapUp(),
              onPanEnd:  (_) => _showHintsTapUp(),
              onLongPressCancel: () => _showHintsTapUp(),
              //onVerticalDragEnd: (_) => _showHintsTapUp(),
              //onHorizontalDragEnd:() => _showHintsTapUp(),

              onLongPressMoveUpdate: _showStrongHintsLongPressMoveUpdate,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[500], // Меняем цвет в зависимости от состояния
                  borderRadius: BorderRadius.circular(10), // Скругление углов
                ),
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                child: const Center(
                  child: Text(
                    'Padoms',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

        ],
      ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text:  TextSpan(
                  style: TextStyle(
                      fontSize: 14, color: Colors.black), // Общий стиль
                  children: [
                    TextSpan(
                        text:
                        'Inovāciju atbalsta centrs: '),

                    WidgetSpan(
                      // Используем WidgetSpan
                      alignment: PlaceholderAlignment.middle, // Добавляем выравнивание
                      child: GestureDetector(
                        onTap: () {
                          Services.Clipboard.setData(const Services.ClipboardData(
                              text: 'info@inovacijucentrs.lv')); // Services.Clipboard
                        },
                        child: const Text(
                          'info@inovacijucentrs.lv',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                      ),
                    ),

                    TextSpan(
                        text:
                        '\nTālrunis: '),

                    WidgetSpan(
                      // Используем WidgetSpan
                      alignment: PlaceholderAlignment.middle, // Добавляем выравнивание
                      child: GestureDetector(
                        onTap: () {
                          Services.Clipboard.setData(const Services.ClipboardData(
                              text: '+371 26172018')); // Services.Clipboard
                        },
                        child: const Text(
                          '+371 26172018',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      // Используем WidgetSpan
                      alignment: PlaceholderAlignment.middle, // Добавляем выравнивание
                      child: GestureDetector(
                        onTap: () {
                          Services.Clipboard.setData(const Services.ClipboardData(
                              text: 'https://www.inovacijucentrs.lv/')); // Services.Clipboard
                        },
                        child: const Text(
                          '     mājas lapa',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    TextSpan(
                        text:
                        '\nDeveloper: '),
                    TextSpan(
                      text: 'Andris Matvejevs ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(
                      // Используем WidgetSpan
                      alignment: PlaceholderAlignment.middle, // Добавляем выравнивание
                      child: GestureDetector(
                        onTap: () {
                          Services.Clipboard.setData(const Services.ClipboardData(
                              text: 'andrismatvejev@inbox.lv')); // Services.Clipboard
                        },
                        child: const Text(
                          'andrismatvejev@inbox.lv',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                      ),
                    ),

                    TextSpan(
                        text: 'Member of the nextage IT team. '),
                TextSpan(

                    text:"Home and industrial automation solutions. Development of software sites, embedded systems, as well as building secure networks. We are able to solve automation problems for which the market does not offer ready-made solutions"
                ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
