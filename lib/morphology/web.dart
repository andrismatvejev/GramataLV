import 'dart:typed_data';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/services.dart'; // для rootBundle
import 'database.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final db = await WasmDatabase.open(
      databaseName: 'lexicon',
      sqlite3Uri: Uri.parse('/sqlite3.wasm'),
      driftWorkerUri: Uri.parse('/drift_worker.dart.js'),
      initializeDatabase: () async {
        // 🧠 Вот здесь загружаем файл базы из assets
        final data = await rootBundle.load('lexicon.db');
        return data.buffer.asUint8List();
      },
    );
    return db.resolvedExecutor;
  });
}
