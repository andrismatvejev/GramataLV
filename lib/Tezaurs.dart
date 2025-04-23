import 'package:flutter/material.dart';
import 'package:galotne_f/morphology/database.dart'; // <-- подключаем базу

class TezaursView extends StatefulWidget {
  const TezaursView({super.key});

  @override
  State<TezaursView> createState() => _TezaursViewState();
}

class _TezaursViewState extends State<TezaursView> {
  final TextEditingController _controller = TextEditingController();
  late AppDatabase database; // подключение к базе
  List<String> _allWords = [];
  List<String> _filteredWords = [];

  @override
  void initState() {
    super.initState();
    database = AppDatabase(); // создаем подключение
    _loadWords();
  }

  Future<void> _loadWords() async {
    try {
      final result = await database.customSelect(
        'SELECT Pamatforma FROM lexemes WHERE Pamatforma IS NOT NULL',
        readsFrom: {database.lexemes},
      ).get();

      final pamatformas = <String>[];

      for (final row in result) {
        final word = row.data['Pamatforma'] as String?;
        if (word != null && word.isNotEmpty) {
          pamatformas.add(word.toLowerCase());
        }
      }

      print('🧩 Загружено слов: ${pamatformas.length}');
      pamatformas.take(10).forEach((w) => print('👉 $w'));

      setState(() {
        _allWords = pamatformas..sort();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Результат загрузки'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Всего слов: ${_allWords.length}'),
                  const SizedBox(height: 10),
                  ..._allWords.take(10).map((e) => Text(e)),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    } catch (e, stack) {
      print('❗ Ошибка при загрузке базы: $e');
      print(stack);
    }
  }



  void _updateSuggestions(String query) {
    final input = query.toLowerCase();
    final matches = _allWords
        .where((word) => word.startsWith(input))
        .take(10)
        .toList();
    print('🔍 Найдено совпадений: ${matches.length} для "$input"');
    setState(() {
      _filteredWords = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Ievadiet vārdu...',
          ),
          onChanged: (value) {
            print('⌨️ Введено: $value');
            _updateSuggestions(value);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredWords.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_filteredWords[index]),
                onTap: () {
                  _controller.text = _filteredWords[index];
                  _updateSuggestions(_filteredWords[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
