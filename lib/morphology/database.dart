import 'package:drift/drift.dart';
import 'shared.dart'; // <-- только shared.dart, ничего больше

part 'database.g.dart';

@DriftDatabase(
  tables: [Lexemes],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection()); // <-- правильно через openConnection

  @override
  int get schemaVersion => 1;
}

class Lexemes extends Table {
  IntColumn get id => integer()();
  TextColumn get stem1 => text()();
  TextColumn get Avots => text().nullable()();
  TextColumn get Darbibas_varda_tips => text().nullable()();
  TextColumn get Deklinacija => text().nullable()();
  TextColumn get Lietvarda_tips => text().nullable()();
  TextColumn get Noliegums => text().nullable()();
  TextColumn get Pamatforma => text().nullable()();
  TextColumn get Reziduala_tips => text().nullable()();
  TextColumn get Skaitlis_2 => text().nullable()();
  TextColumn get Transitivitate => text().nullable()();
  TextColumn get Vardskira => text().nullable()();
  TextColumn get Ipasibas_varda_tips => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
