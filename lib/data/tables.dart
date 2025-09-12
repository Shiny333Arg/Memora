import 'package:drift/drift.dart';

/// ALERTAS (base común)
class Alerts extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Nota / título de la alerta
  TextColumn get title => text()();

  /// 'CATEGORY' | 'PLACE_TIME'
  TextColumn get type =>
      text().check(type.isIn(const ['CATEGORY', 'PLACE_TIME']))();

  /// Habilitada/deshabilitada
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();

  /// Epoch ms de creación
  IntColumn get createdAt =>
      integer().withDefault(Constant(DateTime.now().millisecondsSinceEpoch))();
}

/// CATEGORÍAS (librería, veterinaria, etc.)
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Nombre visible de la categoría (único)
  TextColumn get name => text().unique()();

  /// (Opcional) JSON con place types de Google (ej.: ["book_store"])
  TextColumn get typesJson => text().nullable()();
}

/// Subtabla 1–1: datos de alerta por CATEGORÍA
class AlertCategory extends Table {
  /// PK y FK 1–1 → Alerts.id
  IntColumn get alertId =>
      integer().references(Alerts, #id, onDelete: KeyAction.cascade)();

  /// FK → Categories.id
  IntColumn get categoryId =>
      integer().references(Categories, #id, onDelete: KeyAction.restrict)();

  /// Radio en metros (200–1000 recomendado)
  IntColumn get radius => integer()();

  @override
  Set<Column> get primaryKey => {alertId};
}

/// LUGARES elegidos en mapa (para PLACE_TIME)
class Places extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Nombre opcional (p.ej. "Facultad")
  TextColumn get name => text().nullable()();

  RealColumn get lat => real()();
  RealColumn get lng => real()();
}

/// Subtabla 1–1: datos de alerta por LUGAR + HORARIO
class AlertPlaceTime extends Table {
  /// PK y FK 1–1 → Alerts.id
  IntColumn get alertId =>
      integer().references(Alerts, #id, onDelete: KeyAction.cascade)();

  /// FK → Places.id
  IntColumn get placeId =>
      integer().references(Places, #id, onDelete: KeyAction.restrict)();

  /// (Opcional) radio alrededor del lugar
  IntColumn get radius => integer().nullable()();

  /// Hora de inicio 'HH:mm' (24h)
  TextColumn get startTime => text()();

  /// Hora final opcional 'HH:mm' (ventana)
  TextColumn get endTime => text().nullable()();

  /// Bitmask de días (Lu=1, Ma=2, Mi=4, Ju=8, Vi=16, Sa=32, Do=64)
  IntColumn get daysMask => integer().withDefault(const Constant(0))();

  /// Zona horaria (ej.: 'America/Argentina/Buenos_Aires')
  TextColumn get timezone => text().withDefault(const Constant('UTC'))();

  @override
  Set<Column> get primaryKey => {alertId};
}
