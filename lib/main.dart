import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;
import 'TestView.dart';
import 'table_utils.dart';



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

  List<List<String>> _correctEndings = correctEndings1;
  List<List<String>> _adviceShort = adviceShort1;
  double _tableRowHeight = 40;//высота строки
  int _tableQuarterTurns = 0; //количество поворотов


//боковое меню обработка
  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings1;
          _adviceShort = adviceShort1;
          break;
        case 1:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings2;
          _adviceShort = adviceShort2;
          break;
        case 2:
          _tableRowHeight = 90;
          _tableQuarterTurns = 9;
          _correctEndings = correctEndings3;
          _adviceShort = adviceShort3;
          break;
        case 3:
          _tableRowHeight = 90;
          _tableQuarterTurns = 9;
          _correctEndings = correctEndings4;
          _adviceShort = adviceShort4;
          break;
        case 4:
          _tableRowHeight = 90;
          _tableQuarterTurns = 9;
          _correctEndings = correctEndings5;
          _adviceShort = adviceShort5;
          break;
      }
    });
  }

  //новый метод
  Widget _buildBody() {
    return Center(
      child: TestView(
        correctEndings: _correctEndings,
        adviceShort: _adviceShort,
        tableRowHeight: _tableRowHeight,
        tableQuarterTurns: _tableQuarterTurns,
      ),
    );
  }

  //сам визуал
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


//боковая панель с выбором строки
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Убираем отступы сверху
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Text(
                'Galotnes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Lietvārds'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Īpašības'),
              onTap: () {
                _onItemTapped(1);
                // ... логика для перехода на страницу Īpašības
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_left),
              title: const Text('Darb pag'),
              onTap: () {
                _onItemTapped(2);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_upward),
              title: const Text('Darb nak'),
              onTap: () {
                _onItemTapped(3);
                // ... логика для перехода на страницу Darb nak
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_right),
              title: const Text('Darb tag'),
              onTap: () {
                _onItemTapped(4);
                // ... логика для перехода на страницу Darb tag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
          ],
        ),
      ),

      body: _buildBody(), // Вот где мы вызываем _buildBody()

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Добавляем это
        backgroundColor: Colors.yellow[300], // Меняем цвет
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(color: Colors.black54), // Цвет неактивного текста
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Materials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: 'Examples',
          ),
        ],
        //currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      ),

    );
  }
}
