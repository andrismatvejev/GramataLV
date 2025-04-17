import 'package:flutter/material.dart';


class TableData {
  final List<List<TableCellData>> rows;

  TableData(List<List<String>> data)
      : rows = data.asMap().map((rowIndex, row) {
    return MapEntry(rowIndex, row.asMap().map((columnIndex, cell) {
      final isHeader = rowIndex == 0 || columnIndex == 0;
      return MapEntry(
        columnIndex,
        TableCellData(
          chouse_text: isHeader ? cell : "",
          correct_text: cell,
          isHeader: isHeader,
          color: isHeader ? Colors.brown[200] : Colors.grey[200],
          isShows: false,
        ),
      );
    }).values.toList());
  }).values.toList();
}

class TableCellData {
  String chouse_text;
  final String correct_text;
  final bool isHeader;
  Color? color;
  bool isShows;

  TableCellData({
    required this.chouse_text,
    required this.correct_text,
    this.isHeader = false,
    this.color,
    this.isShows = false,
  });
}


class TableStyles {
  static const TableBorder tableBorder = TableBorder(
    top: BorderSide(color: Colors.black),
    right: BorderSide(color: Colors.black),
    bottom: BorderSide(color: Colors.black),
    left: BorderSide(color: Colors.black),
    horizontalInside: BorderSide(color: Colors.black),
    verticalInside: BorderSide(color: Colors.black),
  );

  static const TextStyle headerTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle SimpleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

}



//создание таблицы по массиву строк
class GalotneTableWidget extends StatelessWidget {
  final TableData table;
  final Function(BuildContext context, int rowIndex, int columnIndex) showDialog;
  final double rowHeight;
  final int quarterTurns;

  const GalotneTableWidget({
    Key? key,
    required this.table,
    required this.showDialog,
    this.rowHeight = 50,
    this.quarterTurns = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Считаем количество столбцов
    int columnCount = table.rows.isNotEmpty && table.rows[0].isNotEmpty ? table.rows[0].length : 0;
    // Создаем Map с динамическими columnWidths
    Map<int, TableColumnWidth> columnWidths = {};
    columnWidths[0] = const FractionColumnWidth(0.2); // Первый столбец всегда 0.1
    if (columnCount > 1) {
      // Для остальных столбцов считаем ширину
      double remainingWidth = 0.8;
      double columnWidth = remainingWidth / (columnCount - 1);
      for (int i = 1; i < columnCount; i++) {
        columnWidths[i] = FractionColumnWidth(columnWidth);
      }
    }
    return Table(
      border: TableStyles.tableBorder,
      columnWidths: columnWidths, // Используем вычисленные ширины
      children: table.rows.map(
            (row) => TableRow(
          children: row.map(
                (cell) => TableCell(
              child: GestureDetector(
                onTap: () {
                  int rowIndex = table.rows.indexOf(row);
                  int columnIndex = row.indexOf(cell);
                  showDialog(context, rowIndex, columnIndex);
                },
                child: Container(
                  color: cell.color,
                  child: SizedBox(
                    height: rowHeight,
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: quarterTurns,
                        child: Text(
                          cell.chouse_text,
                          style: cell.isHeader
                              ? TableStyles.headerTextStyle
                              : TextStyle(
                            color: Colors.black,
                            fontSize: calculateFontSize(cell.correct_text),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ).toList(),
    );
  }
}


 double calculateCellHeight(String text) {
// Возвращаем высоту в зависимости от длины
if (text.length < 5) {
return 50.0; // Короткий текст
} else if (text.length < 10) {
return 70.0; // Средний текст
} else {
return 100.0; // Длинный текст
}
}

 double calculateFontSize(String text) {
// Возвращаем размер шрифта в зависимости от длины
if (text.length < 6) {
return 20.0; // Короткий текст
} else if (text.length < 10) {
return 14.0; // Средний текст
} else {
return 8.0; // Длинный текст
}
}
