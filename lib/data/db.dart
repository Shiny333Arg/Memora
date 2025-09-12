import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    Alerts,
    Categories,
    AlertCategory,
    Places,
    AlertPlaceTime,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Incrementa este número cuando cambies el esquema
  @override
  int get schemaVersion => 1;

  /// (Opcional) Migraciones entre versiones futuras
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      // Índices útiles (performance)
      await customStatement(
          'CREATE INDEX IF NOT EXISTS idx_alerts_enabled ON alerts(enabled)');
      await customStatement(
          'CREATE INDEX IF NOT EXISTS idx_alert_category_cat ON alert_category(category_id)');
      await customStatement(
          'CREATE INDEX IF NOT EXISTS idx_alert_place_time_place ON alert_place_time(place_id)');
    },
    onUpgrade: (m, from, to) async {
      // Aquí irán tus migraciones al subir schemaVersion
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'memora.sqlite'));
    // createInBackground evita bloquear el UI thread
    return NativeDatabase.createInBackground(file);
  });
}
