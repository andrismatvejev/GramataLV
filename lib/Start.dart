import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  // Тексты на разных языках
  final Map<String, String> _descriptions = {
    'lv':
    'Šī lietotne ir izveidota, lai palīdzētu apgūt latviešu valodu. Galvenā funkcija ir trenēt lietvārdu galotņu atcerēšanos dažādos locījumos un deklinācijās. Vēlāk tika papildināta arī ar īpašības vārdu un darbības vārdu galotņu treniņiem. \n\nTreniņš sastāv no tabulu galotņu patstāvīgas aizpildīšanas ar iespēju pārbaudīt atbilžu pareizību. Tabulas izvēle treniņam tiek veikta, izmantojot burgera izvēlni ekrāna augšējā kreisajā stūrī un pogu "Test" apakšējā izvēlnē. Divas pārējās pogas apakšējā izvēlnē nodrošina teoriju un piemērus, lai labāk saprastu, kur ir nepieciešamas apgūstamās tabulas zināšanas. \n\nTestēšanas laikā jums ir jāpieskaras tam tukšajam lauciņam, kuru vēlaties aizpildīt ar pareizo atbildi, un nolaižamajā sarakstā jāizvēlas tā galotne, kuru uzskatāt par pareizu. Zem tabulas ir viena poga un divi slīdņi. Poga pārkrāso jūsu izvēlētās galotnes sarkanā vai zaļā krāsā atkarībā no tā, vai esat norādījis pareizo vērtību. Tādā veidā tiek apgūta tabula. Viss pārējais ir dažādi palīdzības un padomu veidi tiem, kas tikai sāk. Pieskaroties jebkuram lauciņam uznirstošajā logā papildus tabulai noteikti ir teksts, kas var dot mājienu par pareizo galotni. Kreisais slīdnis katrai galotnei piešķirs noteiktu krāsu un iekrāsos visus lauciņus. Labais slīdnis vienkārši parādīs visas galotnes kā ir. Patīkamu mācīšanos!',
    'ru':
    'Это приложение создано для помощи в изучении латышского языка. Основная функция - тренировка запоминания окончаний существительных в разных падежах и склонениях. Впоследствии оно было расширено для тренировки окончаний прилагательных и глаголов. \n\nТренировка заключается в самостоятельном заполнении таблицы окончаний с возможностью проверки правильности. Выбор таблицы для тренировки осуществляется через бургер-меню в верхнем левом углу экрана и кнопку "Test" в нижнем меню. Две другие кнопки в нижнем меню отвечают за теорию и примеры для лучшего понимания, где пригодится знание изучаемой таблицы.\n\nКогда вы находитесь в режиме тестирования, вам необходимо коснуться той пустой ячейки, которую хотите заполнить правильным ответом, и в выпадающем списке выбрать то окончание, которое считаете правильным. Под таблицей есть одна кнопка и два ползунка. Кнопка перекрашивает выбранные вами окончания в красный или зеленый цвет в зависимости от того, правильно ли вы указали значение. Таким образом и осуществляется изучение таблицы. Все остальное - это различные способы помощи и подсказок для тех, кто только начинает. При касании любой ячейки в всплывающем окне помимо таблицы обязательно присутствует текст, способный намекнуть на правильное окончание. Левый ползунок каждому окончанию присвоит определенный цвет и раскрасит все ячейки. Правый ползунок просто покажет все окончания как есть. Приятного изучения!',
    'en':
    'This application is designed to help you learn the Latvian language. The main function is to train the memorization of noun endings in different cases and declensions. Subsequently, it was expanded to train the endings of adjectives and verbs. \n\nThe training consists of independently filling out a table of endings with the possibility of checking the correctness. The choice of a table for training is carried out through the burger menu in the upper left corner of the screen and the "Test" button in the bottom menu. The other two buttons in the bottom menu are responsible for the theory and examples for a better understanding of where knowledge of the studied table will come in handy. \n\nWhen you are in test mode, you need to touch the empty cell that you want to fill in with the correct answer and select the ending that you think is correct in the drop-down list. Below the table there is one button and two sliders. The button repaints the endings you have chosen in red or green depending on whether you have indicated the correct value. This is how the table is studied. Everything else is various ways of help and hints for those who are just starting out. When you touch any cell in the pop-up window, in addition to the table, there is always text that can hint at the correct ending. The left slider will assign a certain color to each ending and color all the cells. The right slider will simply show all the endings as they are. Enjoy studying!'
  };

  String _currentLanguage = 'lv'; // Язык по умолчанию (латышский)

  // Метод для смены языка
  void _changeLanguage(String language) {
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Описание приложения
              Text(
                _descriptions[_currentLanguage]!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              // Кнопки для выбора языка
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _changeLanguage('lv'),
                    style: ButtonStyle(
                        backgroundColor: _currentLanguage == 'lv'
                            ? const MaterialStatePropertyAll<Color>(
                            Colors.blue)
                            : const MaterialStatePropertyAll<Color>(
                            Colors.grey)),
                    child: const Text('Latviešu'),
                  ),
                  const SizedBox(width: 4.0),
                  ElevatedButton(
                    onPressed: () => _changeLanguage('ru'),
                    style: ButtonStyle(
                        backgroundColor: _currentLanguage == 'ru'
                            ? const MaterialStatePropertyAll<Color>(
                            Colors.blue)
                            : const MaterialStatePropertyAll<Color>(
                            Colors.grey)),
                    child: const Text('Русский'),
                  ),
                  const SizedBox(width: 4.0),
                  ElevatedButton(
                    onPressed: () => _changeLanguage('en'),
                    style: ButtonStyle(
                        backgroundColor: _currentLanguage == 'en'
                            ? const MaterialStatePropertyAll<Color>(
                            Colors.blue)
                            : const MaterialStatePropertyAll<Color>(
                            Colors.grey)),
                    child: const Text('English'),
                  ),
                ],
              ),
            ],
          ),
        ),],
      ),
    );
  }
}

