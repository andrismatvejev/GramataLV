import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;
import 'TestView.dart';
import 'SourceView.dart';
import 'Start.dart';
import 'Tezaurs.dart';
import 'ExamplesView.dart';
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
  int _selectedIndex = 0; // Добавляем переменную для отслеживания выбора
  int _NeStandart = 1;
  String _selectedTitle = 'Lietvards'; // Добавляем переменную для заголовка


//боковое меню обработка
  void _onItemTapped(int index) {
    _NeStandart=0;
    setState(() {
      switch (index) {
        case 0:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings1;
          _adviceShort = adviceShort1;
          _selectedTitle = 'Lietvards';
          break;
        case 1:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings2;
          _adviceShort = adviceShort2;
          _selectedTitle = 'Ipašivards';
          break;
        case 2:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings3;
          _adviceShort = adviceShort3;
          _selectedTitle = 'Darbības pagatne';
          break;
        case 4:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings4;
          _adviceShort = adviceShort4;
          _selectedTitle = 'Vietniekvārds';
          break;
        case 5:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings5;
          _adviceShort = adviceShort5;
          _selectedTitle = 'Vietniekvārds 2';
          break;
        case 6:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings6;
          _adviceShort = adviceShort6;
          _selectedTitle = 'Prievārds';
          break;
        case 7:
          _tableRowHeight = 40;
          _tableQuarterTurns = 0;
          _correctEndings = correctEndings7;
          _adviceShort = adviceShort7;
          _selectedTitle = 'Skaitļa';
          break;
        case 3:
          _selectedTitle = 'Tezaurs';
          _NeStandart=2;
          break;

      }
    });
  }


  void _onBottomNavItemTapped(int index) {
    setState(() {
      _NeStandart=0;
      _selectedIndex = index;
    });
  }

  //новый метод
  Widget _buildBody() {
    if(_NeStandart==0){
    switch (_selectedIndex) {
      case 0:
        return Center(
          child: TestView(
            correctEndings: _correctEndings,
            adviceShort: _adviceShort,
            tableRowHeight: _tableRowHeight,
            tableQuarterTurns: _tableQuarterTurns,
          ),
        );
      case 1:
        return const MaterialsView(); // Показываем MaterialsView
      case 2:
        return const ExamplesView(); // Показываем ExamplesView
      case 3:
        return const StartView(); // Показываем ExamplesView
      default:
        return const StartView();

    }}else{
      switch (_NeStandart) {
        case 1:
          return const StartView(); // Показываем MaterialsView
        case 2:
          return const TezaursView(); // Показываем ExamplesView
        default:
          return const StartView();

      }

    }
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
              child: Text(_selectedTitle),
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
                color: Colors.orangeAccent,
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
              leading: const Icon(Icons.add_circle),
              title: const Text('Darbības'),
              onTap: () {
                _onItemTapped(2);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text('Vietniekvārds'),
              onTap: () {
                _onItemTapped(4);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('Vietniekvārds 2'),
              onTap: () {
                _onItemTapped(5);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_tree),
              title: const Text('Prievārds'),
              onTap: () {
                _onItemTapped(6);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Skaitļa'),
              onTap: () {
                _onItemTapped(7);
                // ... логика для перехода на страницу Darb pag
                Navigator.pop(context); // Закрываем Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_left),
              title: const Text('Tezaurs'),
              onTap: () {
                _onItemTapped(3);
                // ... логика для перехода на страницу Darb pag
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onBottomNavItemTapped,
      ),

    );
  }
}
