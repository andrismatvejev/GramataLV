import 'package:flutter/material.dart';

class TezaursView extends StatefulWidget {
  const TezaursView({super.key});

  @override
  State<TezaursView> createState() => _TezaursViewState();
}

class _TezaursViewState extends State<TezaursView> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _allWords = []; // Здесь будет список всех слов из файлов.
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    loadWords(); // загружаем слова
  }

  void loadWords() async {
    // Здесь нужно будет загрузить слова из файла.
    // Пока просто для примера:
    _allWords.addAll([
      "ābece", "ābols", "abstrakcija", "absolvents", "abonements", "akcija", "akti", "aktieris", "adrese", "airētājs"
    ]);
    setState(() {});
  }

  void _onTextChanged(String input) {
    setState(() {
      _suggestions = _allWords
          .where((word) => word.startsWith(input.toLowerCase()))
          .take(10)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: _onTextChanged,
          decoration: const InputDecoration(
            labelText: 'Ievadiet vārdu',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: _suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_suggestions[index]),
                onTap: () {
                  // Можно сделать что-то при выборе слова
                  print('Selected: ${_suggestions[index]}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
