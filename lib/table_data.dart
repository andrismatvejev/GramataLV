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
          color: isHeader ? Colors.yellow[200] : Colors.grey[200],
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



class GalotneTableWidget extends StatelessWidget {
  final TableData table;
  final Function(BuildContext context, int rowIndex, int columnIndex) showDialog;

  const GalotneTableWidget({Key? key, required this.table, required this.showDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableStyles.tableBorder,
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(0.1),
        1: FractionColumnWidth(0.15),
        2: FractionColumnWidth(0.15),
        3: FractionColumnWidth(0.15),
        4: FractionColumnWidth(0.15),
        5: FractionColumnWidth(0.15),
        6: FractionColumnWidth(0.15),
      },
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
                    height: 45,
                    child: Center(
                      child: Text(
                        cell.chouse_text,
                        style: cell.isHeader
                            ? TableStyles.headerTextStyle
                            : TableStyles.SimpleTextStyle,
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


