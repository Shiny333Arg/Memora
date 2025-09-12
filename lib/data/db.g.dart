// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $AlertsTable extends Alerts with TableInfo<$AlertsTable, Alert> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    check: () => type.isIn(const ['CATEGORY', 'PLACE_TIME']),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: Constant(DateTime.now().millisecondsSinceEpoch),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, type, enabled, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alerts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Alert> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Alert map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Alert(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AlertsTable createAlias(String alias) {
    return $AlertsTable(attachedDatabase, alias);
  }
}

class Alert extends DataClass implements Insertable<Alert> {
  final int id;

  /// Nota / título de la alerta
  final String title;

  /// 'CATEGORY' | 'PLACE_TIME'
  final String type;

  /// Habilitada/deshabilitada
  final bool enabled;

  /// Epoch ms de creación
  final int createdAt;
  const Alert({
    required this.id,
    required this.title,
    required this.type,
    required this.enabled,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  AlertsCompanion toCompanion(bool nullToAbsent) {
    return AlertsCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
    );
  }

  factory Alert.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Alert(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Alert copyWith({
    int? id,
    String? title,
    String? type,
    bool? enabled,
    int? createdAt,
  }) => Alert(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    enabled: enabled ?? this.enabled,
    createdAt: createdAt ?? this.createdAt,
  );
  Alert copyWithCompanion(AlertsCompanion data) {
    return Alert(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Alert(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type, enabled, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Alert &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt);
}

class AlertsCompanion extends UpdateCompanion<Alert> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> type;
  final Value<bool> enabled;
  final Value<int> createdAt;
  const AlertsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AlertsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String type,
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       type = Value(type);
  static Insertable<Alert> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<bool>? enabled,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AlertsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? type,
    Value<bool>? enabled,
    Value<int>? createdAt,
  }) {
    return AlertsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _typesJsonMeta = const VerificationMeta(
    'typesJson',
  );
  @override
  late final GeneratedColumn<String> typesJson = GeneratedColumn<String>(
    'types_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, typesJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('types_json')) {
      context.handle(
        _typesJsonMeta,
        typesJson.isAcceptableOrUnknown(data['types_json']!, _typesJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      typesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}types_json'],
      ),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;

  /// Nombre visible de la categoría (único)
  final String name;

  /// (Opcional) JSON con place types de Google (ej.: ["book_store"])
  final String? typesJson;
  const Category({required this.id, required this.name, this.typesJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || typesJson != null) {
      map['types_json'] = Variable<String>(typesJson);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      typesJson: typesJson == null && nullToAbsent
          ? const Value.absent()
          : Value(typesJson),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      typesJson: serializer.fromJson<String?>(json['typesJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'typesJson': serializer.toJson<String?>(typesJson),
    };
  }

  Category copyWith({
    int? id,
    String? name,
    Value<String?> typesJson = const Value.absent(),
  }) => Category(
    id: id ?? this.id,
    name: name ?? this.name,
    typesJson: typesJson.present ? typesJson.value : this.typesJson,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      typesJson: data.typesJson.present ? data.typesJson.value : this.typesJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('typesJson: $typesJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, typesJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.typesJson == this.typesJson);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> typesJson;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.typesJson = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.typesJson = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? typesJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (typesJson != null) 'types_json': typesJson,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? typesJson,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      typesJson: typesJson ?? this.typesJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (typesJson.present) {
      map['types_json'] = Variable<String>(typesJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('typesJson: $typesJson')
          ..write(')'))
        .toString();
  }
}

class $AlertCategoryTable extends AlertCategory
    with TableInfo<$AlertCategoryTable, AlertCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _alertIdMeta = const VerificationMeta(
    'alertId',
  );
  @override
  late final GeneratedColumn<int> alertId = GeneratedColumn<int>(
    'alert_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alerts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _radiusMeta = const VerificationMeta('radius');
  @override
  late final GeneratedColumn<int> radius = GeneratedColumn<int>(
    'radius',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [alertId, categoryId, radius];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alert_category';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlertCategoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('alert_id')) {
      context.handle(
        _alertIdMeta,
        alertId.isAcceptableOrUnknown(data['alert_id']!, _alertIdMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('radius')) {
      context.handle(
        _radiusMeta,
        radius.isAcceptableOrUnknown(data['radius']!, _radiusMeta),
      );
    } else if (isInserting) {
      context.missing(_radiusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {alertId};
  @override
  AlertCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlertCategoryData(
      alertId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      radius: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}radius'],
      )!,
    );
  }

  @override
  $AlertCategoryTable createAlias(String alias) {
    return $AlertCategoryTable(attachedDatabase, alias);
  }
}

class AlertCategoryData extends DataClass
    implements Insertable<AlertCategoryData> {
  /// PK y FK 1–1 → Alerts.id
  final int alertId;

  /// FK → Categories.id
  final int categoryId;

  /// Radio en metros (200–1000 recomendado)
  final int radius;
  const AlertCategoryData({
    required this.alertId,
    required this.categoryId,
    required this.radius,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['alert_id'] = Variable<int>(alertId);
    map['category_id'] = Variable<int>(categoryId);
    map['radius'] = Variable<int>(radius);
    return map;
  }

  AlertCategoryCompanion toCompanion(bool nullToAbsent) {
    return AlertCategoryCompanion(
      alertId: Value(alertId),
      categoryId: Value(categoryId),
      radius: Value(radius),
    );
  }

  factory AlertCategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlertCategoryData(
      alertId: serializer.fromJson<int>(json['alertId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      radius: serializer.fromJson<int>(json['radius']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'alertId': serializer.toJson<int>(alertId),
      'categoryId': serializer.toJson<int>(categoryId),
      'radius': serializer.toJson<int>(radius),
    };
  }

  AlertCategoryData copyWith({int? alertId, int? categoryId, int? radius}) =>
      AlertCategoryData(
        alertId: alertId ?? this.alertId,
        categoryId: categoryId ?? this.categoryId,
        radius: radius ?? this.radius,
      );
  AlertCategoryData copyWithCompanion(AlertCategoryCompanion data) {
    return AlertCategoryData(
      alertId: data.alertId.present ? data.alertId.value : this.alertId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      radius: data.radius.present ? data.radius.value : this.radius,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlertCategoryData(')
          ..write('alertId: $alertId, ')
          ..write('categoryId: $categoryId, ')
          ..write('radius: $radius')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(alertId, categoryId, radius);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlertCategoryData &&
          other.alertId == this.alertId &&
          other.categoryId == this.categoryId &&
          other.radius == this.radius);
}

class AlertCategoryCompanion extends UpdateCompanion<AlertCategoryData> {
  final Value<int> alertId;
  final Value<int> categoryId;
  final Value<int> radius;
  const AlertCategoryCompanion({
    this.alertId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.radius = const Value.absent(),
  });
  AlertCategoryCompanion.insert({
    this.alertId = const Value.absent(),
    required int categoryId,
    required int radius,
  }) : categoryId = Value(categoryId),
       radius = Value(radius);
  static Insertable<AlertCategoryData> custom({
    Expression<int>? alertId,
    Expression<int>? categoryId,
    Expression<int>? radius,
  }) {
    return RawValuesInsertable({
      if (alertId != null) 'alert_id': alertId,
      if (categoryId != null) 'category_id': categoryId,
      if (radius != null) 'radius': radius,
    });
  }

  AlertCategoryCompanion copyWith({
    Value<int>? alertId,
    Value<int>? categoryId,
    Value<int>? radius,
  }) {
    return AlertCategoryCompanion(
      alertId: alertId ?? this.alertId,
      categoryId: categoryId ?? this.categoryId,
      radius: radius ?? this.radius,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (alertId.present) {
      map['alert_id'] = Variable<int>(alertId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (radius.present) {
      map['radius'] = Variable<int>(radius.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertCategoryCompanion(')
          ..write('alertId: $alertId, ')
          ..write('categoryId: $categoryId, ')
          ..write('radius: $radius')
          ..write(')'))
        .toString();
  }
}

class $PlacesTable extends Places with TableInfo<$PlacesTable, Place> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, lat, lng];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places';
  @override
  VerificationContext validateIntegrity(
    Insertable<Place> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Place map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Place(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
    );
  }

  @override
  $PlacesTable createAlias(String alias) {
    return $PlacesTable(attachedDatabase, alias);
  }
}

class Place extends DataClass implements Insertable<Place> {
  final int id;

  /// Nombre opcional (p.ej. "Facultad")
  final String? name;
  final double lat;
  final double lng;
  const Place({
    required this.id,
    this.name,
    required this.lat,
    required this.lng,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    return map;
  }

  PlacesCompanion toCompanion(bool nullToAbsent) {
    return PlacesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lat: Value(lat),
      lng: Value(lng),
    );
  }

  factory Place.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Place(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
    };
  }

  Place copyWith({
    int? id,
    Value<String?> name = const Value.absent(),
    double? lat,
    double? lng,
  }) => Place(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );
  Place copyWithCompanion(PlacesCompanion data) {
    return Place(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Place(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Place &&
          other.id == this.id &&
          other.name == this.name &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class PlacesCompanion extends UpdateCompanion<Place> {
  final Value<int> id;
  final Value<String?> name;
  final Value<double> lat;
  final Value<double> lng;
  const PlacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  PlacesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    required double lat,
    required double lng,
  }) : lat = Value(lat),
       lng = Value(lng);
  static Insertable<Place> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? lat,
    Expression<double>? lng,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  PlacesCompanion copyWith({
    Value<int>? id,
    Value<String?>? name,
    Value<double>? lat,
    Value<double>? lng,
  }) {
    return PlacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

class $AlertPlaceTimeTable extends AlertPlaceTime
    with TableInfo<$AlertPlaceTimeTable, AlertPlaceTimeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlertPlaceTimeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _alertIdMeta = const VerificationMeta(
    'alertId',
  );
  @override
  late final GeneratedColumn<int> alertId = GeneratedColumn<int>(
    'alert_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES alerts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _radiusMeta = const VerificationMeta('radius');
  @override
  late final GeneratedColumn<int> radius = GeneratedColumn<int>(
    'radius',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _daysMaskMeta = const VerificationMeta(
    'daysMask',
  );
  @override
  late final GeneratedColumn<int> daysMask = GeneratedColumn<int>(
    'days_mask',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('UTC'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    alertId,
    placeId,
    radius,
    startTime,
    endTime,
    daysMask,
    timezone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'alert_place_time';
  @override
  VerificationContext validateIntegrity(
    Insertable<AlertPlaceTimeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('alert_id')) {
      context.handle(
        _alertIdMeta,
        alertId.isAcceptableOrUnknown(data['alert_id']!, _alertIdMeta),
      );
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_placeIdMeta);
    }
    if (data.containsKey('radius')) {
      context.handle(
        _radiusMeta,
        radius.isAcceptableOrUnknown(data['radius']!, _radiusMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('days_mask')) {
      context.handle(
        _daysMaskMeta,
        daysMask.isAcceptableOrUnknown(data['days_mask']!, _daysMaskMeta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {alertId};
  @override
  AlertPlaceTimeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlertPlaceTimeData(
      alertId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_id'],
      )!,
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      )!,
      radius: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}radius'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_time'],
      ),
      daysMask: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}days_mask'],
      )!,
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
    );
  }

  @override
  $AlertPlaceTimeTable createAlias(String alias) {
    return $AlertPlaceTimeTable(attachedDatabase, alias);
  }
}

class AlertPlaceTimeData extends DataClass
    implements Insertable<AlertPlaceTimeData> {
  /// PK y FK 1–1 → Alerts.id
  final int alertId;

  /// FK → Places.id
  final int placeId;

  /// (Opcional) radio alrededor del lugar
  final int? radius;

  /// Hora de inicio 'HH:mm' (24h)
  final String startTime;

  /// Hora final opcional 'HH:mm' (ventana)
  final String? endTime;

  /// Bitmask de días (Lu=1, Ma=2, Mi=4, Ju=8, Vi=16, Sa=32, Do=64)
  final int daysMask;

  /// Zona horaria (ej.: 'America/Argentina/Buenos_Aires')
  final String timezone;
  const AlertPlaceTimeData({
    required this.alertId,
    required this.placeId,
    this.radius,
    required this.startTime,
    this.endTime,
    required this.daysMask,
    required this.timezone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['alert_id'] = Variable<int>(alertId);
    map['place_id'] = Variable<int>(placeId);
    if (!nullToAbsent || radius != null) {
      map['radius'] = Variable<int>(radius);
    }
    map['start_time'] = Variable<String>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String>(endTime);
    }
    map['days_mask'] = Variable<int>(daysMask);
    map['timezone'] = Variable<String>(timezone);
    return map;
  }

  AlertPlaceTimeCompanion toCompanion(bool nullToAbsent) {
    return AlertPlaceTimeCompanion(
      alertId: Value(alertId),
      placeId: Value(placeId),
      radius: radius == null && nullToAbsent
          ? const Value.absent()
          : Value(radius),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      daysMask: Value(daysMask),
      timezone: Value(timezone),
    );
  }

  factory AlertPlaceTimeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlertPlaceTimeData(
      alertId: serializer.fromJson<int>(json['alertId']),
      placeId: serializer.fromJson<int>(json['placeId']),
      radius: serializer.fromJson<int?>(json['radius']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      daysMask: serializer.fromJson<int>(json['daysMask']),
      timezone: serializer.fromJson<String>(json['timezone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'alertId': serializer.toJson<int>(alertId),
      'placeId': serializer.toJson<int>(placeId),
      'radius': serializer.toJson<int?>(radius),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'daysMask': serializer.toJson<int>(daysMask),
      'timezone': serializer.toJson<String>(timezone),
    };
  }

  AlertPlaceTimeData copyWith({
    int? alertId,
    int? placeId,
    Value<int?> radius = const Value.absent(),
    String? startTime,
    Value<String?> endTime = const Value.absent(),
    int? daysMask,
    String? timezone,
  }) => AlertPlaceTimeData(
    alertId: alertId ?? this.alertId,
    placeId: placeId ?? this.placeId,
    radius: radius.present ? radius.value : this.radius,
    startTime: startTime ?? this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    daysMask: daysMask ?? this.daysMask,
    timezone: timezone ?? this.timezone,
  );
  AlertPlaceTimeData copyWithCompanion(AlertPlaceTimeCompanion data) {
    return AlertPlaceTimeData(
      alertId: data.alertId.present ? data.alertId.value : this.alertId,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      radius: data.radius.present ? data.radius.value : this.radius,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      daysMask: data.daysMask.present ? data.daysMask.value : this.daysMask,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlertPlaceTimeData(')
          ..write('alertId: $alertId, ')
          ..write('placeId: $placeId, ')
          ..write('radius: $radius, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('daysMask: $daysMask, ')
          ..write('timezone: $timezone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    alertId,
    placeId,
    radius,
    startTime,
    endTime,
    daysMask,
    timezone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlertPlaceTimeData &&
          other.alertId == this.alertId &&
          other.placeId == this.placeId &&
          other.radius == this.radius &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.daysMask == this.daysMask &&
          other.timezone == this.timezone);
}

class AlertPlaceTimeCompanion extends UpdateCompanion<AlertPlaceTimeData> {
  final Value<int> alertId;
  final Value<int> placeId;
  final Value<int?> radius;
  final Value<String> startTime;
  final Value<String?> endTime;
  final Value<int> daysMask;
  final Value<String> timezone;
  const AlertPlaceTimeCompanion({
    this.alertId = const Value.absent(),
    this.placeId = const Value.absent(),
    this.radius = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.daysMask = const Value.absent(),
    this.timezone = const Value.absent(),
  });
  AlertPlaceTimeCompanion.insert({
    this.alertId = const Value.absent(),
    required int placeId,
    this.radius = const Value.absent(),
    required String startTime,
    this.endTime = const Value.absent(),
    this.daysMask = const Value.absent(),
    this.timezone = const Value.absent(),
  }) : placeId = Value(placeId),
       startTime = Value(startTime);
  static Insertable<AlertPlaceTimeData> custom({
    Expression<int>? alertId,
    Expression<int>? placeId,
    Expression<int>? radius,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? daysMask,
    Expression<String>? timezone,
  }) {
    return RawValuesInsertable({
      if (alertId != null) 'alert_id': alertId,
      if (placeId != null) 'place_id': placeId,
      if (radius != null) 'radius': radius,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (daysMask != null) 'days_mask': daysMask,
      if (timezone != null) 'timezone': timezone,
    });
  }

  AlertPlaceTimeCompanion copyWith({
    Value<int>? alertId,
    Value<int>? placeId,
    Value<int?>? radius,
    Value<String>? startTime,
    Value<String?>? endTime,
    Value<int>? daysMask,
    Value<String>? timezone,
  }) {
    return AlertPlaceTimeCompanion(
      alertId: alertId ?? this.alertId,
      placeId: placeId ?? this.placeId,
      radius: radius ?? this.radius,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      daysMask: daysMask ?? this.daysMask,
      timezone: timezone ?? this.timezone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (alertId.present) {
      map['alert_id'] = Variable<int>(alertId.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (radius.present) {
      map['radius'] = Variable<int>(radius.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (daysMask.present) {
      map['days_mask'] = Variable<int>(daysMask.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlertPlaceTimeCompanion(')
          ..write('alertId: $alertId, ')
          ..write('placeId: $placeId, ')
          ..write('radius: $radius, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('daysMask: $daysMask, ')
          ..write('timezone: $timezone')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AlertsTable alerts = $AlertsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $AlertCategoryTable alertCategory = $AlertCategoryTable(this);
  late final $PlacesTable places = $PlacesTable(this);
  late final $AlertPlaceTimeTable alertPlaceTime = $AlertPlaceTimeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    alerts,
    categories,
    alertCategory,
    places,
    alertPlaceTime,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'alerts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('alert_category', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'alerts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('alert_place_time', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AlertsTableCreateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      required String title,
      required String type,
      Value<bool> enabled,
      Value<int> createdAt,
    });
typedef $$AlertsTableUpdateCompanionBuilder =
    AlertsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> type,
      Value<bool> enabled,
      Value<int> createdAt,
    });

final class $$AlertsTableReferences
    extends BaseReferences<_$AppDatabase, $AlertsTable, Alert> {
  $$AlertsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AlertCategoryTable, List<AlertCategoryData>>
  _alertCategoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alertCategory,
    aliasName: $_aliasNameGenerator(db.alerts.id, db.alertCategory.alertId),
  );

  $$AlertCategoryTableProcessedTableManager get alertCategoryRefs {
    final manager = $$AlertCategoryTableTableManager(
      $_db,
      $_db.alertCategory,
    ).filter((f) => f.alertId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alertCategoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AlertPlaceTimeTable, List<AlertPlaceTimeData>>
  _alertPlaceTimeRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alertPlaceTime,
    aliasName: $_aliasNameGenerator(db.alerts.id, db.alertPlaceTime.alertId),
  );

  $$AlertPlaceTimeTableProcessedTableManager get alertPlaceTimeRefs {
    final manager = $$AlertPlaceTimeTableTableManager(
      $_db,
      $_db.alertPlaceTime,
    ).filter((f) => f.alertId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alertPlaceTimeRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AlertsTableFilterComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> alertCategoryRefs(
    Expression<bool> Function($$AlertCategoryTableFilterComposer f) f,
  ) {
    final $$AlertCategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertCategory,
      getReferencedColumn: (t) => t.alertId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertCategoryTableFilterComposer(
            $db: $db,
            $table: $db.alertCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> alertPlaceTimeRefs(
    Expression<bool> Function($$AlertPlaceTimeTableFilterComposer f) f,
  ) {
    final $$AlertPlaceTimeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertPlaceTime,
      getReferencedColumn: (t) => t.alertId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertPlaceTimeTableFilterComposer(
            $db: $db,
            $table: $db.alertPlaceTime,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlertsTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AlertsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertsTable> {
  $$AlertsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> alertCategoryRefs<T extends Object>(
    Expression<T> Function($$AlertCategoryTableAnnotationComposer a) f,
  ) {
    final $$AlertCategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertCategory,
      getReferencedColumn: (t) => t.alertId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertCategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.alertCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> alertPlaceTimeRefs<T extends Object>(
    Expression<T> Function($$AlertPlaceTimeTableAnnotationComposer a) f,
  ) {
    final $$AlertPlaceTimeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertPlaceTime,
      getReferencedColumn: (t) => t.alertId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertPlaceTimeTableAnnotationComposer(
            $db: $db,
            $table: $db.alertPlaceTime,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AlertsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertsTable,
          Alert,
          $$AlertsTableFilterComposer,
          $$AlertsTableOrderingComposer,
          $$AlertsTableAnnotationComposer,
          $$AlertsTableCreateCompanionBuilder,
          $$AlertsTableUpdateCompanionBuilder,
          (Alert, $$AlertsTableReferences),
          Alert,
          PrefetchHooks Function({
            bool alertCategoryRefs,
            bool alertPlaceTimeRefs,
          })
        > {
  $$AlertsTableTableManager(_$AppDatabase db, $AlertsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => AlertsCompanion(
                id: id,
                title: title,
                type: type,
                enabled: enabled,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String type,
                Value<bool> enabled = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => AlertsCompanion.insert(
                id: id,
                title: title,
                type: type,
                enabled: enabled,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AlertsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({alertCategoryRefs = false, alertPlaceTimeRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (alertCategoryRefs) db.alertCategory,
                    if (alertPlaceTimeRefs) db.alertPlaceTime,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (alertCategoryRefs)
                        await $_getPrefetchedData<
                          Alert,
                          $AlertsTable,
                          AlertCategoryData
                        >(
                          currentTable: table,
                          referencedTable: $$AlertsTableReferences
                              ._alertCategoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AlertsTableReferences(
                                db,
                                table,
                                p0,
                              ).alertCategoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.alertId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (alertPlaceTimeRefs)
                        await $_getPrefetchedData<
                          Alert,
                          $AlertsTable,
                          AlertPlaceTimeData
                        >(
                          currentTable: table,
                          referencedTable: $$AlertsTableReferences
                              ._alertPlaceTimeRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AlertsTableReferences(
                                db,
                                table,
                                p0,
                              ).alertPlaceTimeRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.alertId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AlertsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertsTable,
      Alert,
      $$AlertsTableFilterComposer,
      $$AlertsTableOrderingComposer,
      $$AlertsTableAnnotationComposer,
      $$AlertsTableCreateCompanionBuilder,
      $$AlertsTableUpdateCompanionBuilder,
      (Alert, $$AlertsTableReferences),
      Alert,
      PrefetchHooks Function({bool alertCategoryRefs, bool alertPlaceTimeRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> typesJson,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> typesJson,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AlertCategoryTable, List<AlertCategoryData>>
  _alertCategoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alertCategory,
    aliasName: $_aliasNameGenerator(
      db.categories.id,
      db.alertCategory.categoryId,
    ),
  );

  $$AlertCategoryTableProcessedTableManager get alertCategoryRefs {
    final manager = $$AlertCategoryTableTableManager(
      $_db,
      $_db.alertCategory,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alertCategoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typesJson => $composableBuilder(
    column: $table.typesJson,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> alertCategoryRefs(
    Expression<bool> Function($$AlertCategoryTableFilterComposer f) f,
  ) {
    final $$AlertCategoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertCategory,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertCategoryTableFilterComposer(
            $db: $db,
            $table: $db.alertCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typesJson => $composableBuilder(
    column: $table.typesJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get typesJson =>
      $composableBuilder(column: $table.typesJson, builder: (column) => column);

  Expression<T> alertCategoryRefs<T extends Object>(
    Expression<T> Function($$AlertCategoryTableAnnotationComposer a) f,
  ) {
    final $$AlertCategoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertCategory,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertCategoryTableAnnotationComposer(
            $db: $db,
            $table: $db.alertCategory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool alertCategoryRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> typesJson = const Value.absent(),
              }) =>
                  CategoriesCompanion(id: id, name: name, typesJson: typesJson),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> typesJson = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                typesJson: typesJson,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({alertCategoryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (alertCategoryRefs) db.alertCategory,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (alertCategoryRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      AlertCategoryData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._alertCategoryRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).alertCategoryRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool alertCategoryRefs})
    >;
typedef $$AlertCategoryTableCreateCompanionBuilder =
    AlertCategoryCompanion Function({
      Value<int> alertId,
      required int categoryId,
      required int radius,
    });
typedef $$AlertCategoryTableUpdateCompanionBuilder =
    AlertCategoryCompanion Function({
      Value<int> alertId,
      Value<int> categoryId,
      Value<int> radius,
    });

final class $$AlertCategoryTableReferences
    extends
        BaseReferences<_$AppDatabase, $AlertCategoryTable, AlertCategoryData> {
  $$AlertCategoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AlertsTable _alertIdTable(_$AppDatabase db) => db.alerts.createAlias(
    $_aliasNameGenerator(db.alertCategory.alertId, db.alerts.id),
  );

  $$AlertsTableProcessedTableManager get alertId {
    final $_column = $_itemColumn<int>('alert_id')!;

    final manager = $$AlertsTableTableManager(
      $_db,
      $_db.alerts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_alertIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.alertCategory.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlertCategoryTableFilterComposer
    extends Composer<_$AppDatabase, $AlertCategoryTable> {
  $$AlertCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnFilters(column),
  );

  $$AlertsTableFilterComposer get alertId {
    final $$AlertsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableFilterComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertCategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertCategoryTable> {
  $$AlertCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnOrderings(column),
  );

  $$AlertsTableOrderingComposer get alertId {
    final $$AlertsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableOrderingComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertCategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertCategoryTable> {
  $$AlertCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get radius =>
      $composableBuilder(column: $table.radius, builder: (column) => column);

  $$AlertsTableAnnotationComposer get alertId {
    final $$AlertsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableAnnotationComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertCategoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertCategoryTable,
          AlertCategoryData,
          $$AlertCategoryTableFilterComposer,
          $$AlertCategoryTableOrderingComposer,
          $$AlertCategoryTableAnnotationComposer,
          $$AlertCategoryTableCreateCompanionBuilder,
          $$AlertCategoryTableUpdateCompanionBuilder,
          (AlertCategoryData, $$AlertCategoryTableReferences),
          AlertCategoryData,
          PrefetchHooks Function({bool alertId, bool categoryId})
        > {
  $$AlertCategoryTableTableManager(_$AppDatabase db, $AlertCategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertCategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertCategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertCategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> alertId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<int> radius = const Value.absent(),
              }) => AlertCategoryCompanion(
                alertId: alertId,
                categoryId: categoryId,
                radius: radius,
              ),
          createCompanionCallback:
              ({
                Value<int> alertId = const Value.absent(),
                required int categoryId,
                required int radius,
              }) => AlertCategoryCompanion.insert(
                alertId: alertId,
                categoryId: categoryId,
                radius: radius,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AlertCategoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({alertId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (alertId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.alertId,
                                referencedTable: $$AlertCategoryTableReferences
                                    ._alertIdTable(db),
                                referencedColumn: $$AlertCategoryTableReferences
                                    ._alertIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$AlertCategoryTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$AlertCategoryTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AlertCategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertCategoryTable,
      AlertCategoryData,
      $$AlertCategoryTableFilterComposer,
      $$AlertCategoryTableOrderingComposer,
      $$AlertCategoryTableAnnotationComposer,
      $$AlertCategoryTableCreateCompanionBuilder,
      $$AlertCategoryTableUpdateCompanionBuilder,
      (AlertCategoryData, $$AlertCategoryTableReferences),
      AlertCategoryData,
      PrefetchHooks Function({bool alertId, bool categoryId})
    >;
typedef $$PlacesTableCreateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      Value<String?> name,
      required double lat,
      required double lng,
    });
typedef $$PlacesTableUpdateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      Value<String?> name,
      Value<double> lat,
      Value<double> lng,
    });

final class $$PlacesTableReferences
    extends BaseReferences<_$AppDatabase, $PlacesTable, Place> {
  $$PlacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AlertPlaceTimeTable, List<AlertPlaceTimeData>>
  _alertPlaceTimeRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.alertPlaceTime,
    aliasName: $_aliasNameGenerator(db.places.id, db.alertPlaceTime.placeId),
  );

  $$AlertPlaceTimeTableProcessedTableManager get alertPlaceTimeRefs {
    final manager = $$AlertPlaceTimeTableTableManager(
      $_db,
      $_db.alertPlaceTime,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_alertPlaceTimeRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlacesTableFilterComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> alertPlaceTimeRefs(
    Expression<bool> Function($$AlertPlaceTimeTableFilterComposer f) f,
  ) {
    final $$AlertPlaceTimeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertPlaceTime,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertPlaceTimeTableFilterComposer(
            $db: $db,
            $table: $db.alertPlaceTime,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  Expression<T> alertPlaceTimeRefs<T extends Object>(
    Expression<T> Function($$AlertPlaceTimeTableAnnotationComposer a) f,
  ) {
    final $$AlertPlaceTimeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.alertPlaceTime,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertPlaceTimeTableAnnotationComposer(
            $db: $db,
            $table: $db.alertPlaceTime,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlacesTable,
          Place,
          $$PlacesTableFilterComposer,
          $$PlacesTableOrderingComposer,
          $$PlacesTableAnnotationComposer,
          $$PlacesTableCreateCompanionBuilder,
          $$PlacesTableUpdateCompanionBuilder,
          (Place, $$PlacesTableReferences),
          Place,
          PrefetchHooks Function({bool alertPlaceTimeRefs})
        > {
  $$PlacesTableTableManager(_$AppDatabase db, $PlacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
              }) => PlacesCompanion(id: id, name: name, lat: lat, lng: lng),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                required double lat,
                required double lng,
              }) => PlacesCompanion.insert(
                id: id,
                name: name,
                lat: lat,
                lng: lng,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PlacesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({alertPlaceTimeRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (alertPlaceTimeRefs) db.alertPlaceTime,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (alertPlaceTimeRefs)
                    await $_getPrefetchedData<
                      Place,
                      $PlacesTable,
                      AlertPlaceTimeData
                    >(
                      currentTable: table,
                      referencedTable: $$PlacesTableReferences
                          ._alertPlaceTimeRefsTable(db),
                      managerFromTypedResult: (p0) => $$PlacesTableReferences(
                        db,
                        table,
                        p0,
                      ).alertPlaceTimeRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.placeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PlacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlacesTable,
      Place,
      $$PlacesTableFilterComposer,
      $$PlacesTableOrderingComposer,
      $$PlacesTableAnnotationComposer,
      $$PlacesTableCreateCompanionBuilder,
      $$PlacesTableUpdateCompanionBuilder,
      (Place, $$PlacesTableReferences),
      Place,
      PrefetchHooks Function({bool alertPlaceTimeRefs})
    >;
typedef $$AlertPlaceTimeTableCreateCompanionBuilder =
    AlertPlaceTimeCompanion Function({
      Value<int> alertId,
      required int placeId,
      Value<int?> radius,
      required String startTime,
      Value<String?> endTime,
      Value<int> daysMask,
      Value<String> timezone,
    });
typedef $$AlertPlaceTimeTableUpdateCompanionBuilder =
    AlertPlaceTimeCompanion Function({
      Value<int> alertId,
      Value<int> placeId,
      Value<int?> radius,
      Value<String> startTime,
      Value<String?> endTime,
      Value<int> daysMask,
      Value<String> timezone,
    });

final class $$AlertPlaceTimeTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AlertPlaceTimeTable,
          AlertPlaceTimeData
        > {
  $$AlertPlaceTimeTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AlertsTable _alertIdTable(_$AppDatabase db) => db.alerts.createAlias(
    $_aliasNameGenerator(db.alertPlaceTime.alertId, db.alerts.id),
  );

  $$AlertsTableProcessedTableManager get alertId {
    final $_column = $_itemColumn<int>('alert_id')!;

    final manager = $$AlertsTableTableManager(
      $_db,
      $_db.alerts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_alertIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlacesTable _placeIdTable(_$AppDatabase db) => db.places.createAlias(
    $_aliasNameGenerator(db.alertPlaceTime.placeId, db.places.id),
  );

  $$PlacesTableProcessedTableManager get placeId {
    final $_column = $_itemColumn<int>('place_id')!;

    final manager = $$PlacesTableTableManager(
      $_db,
      $_db.places,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AlertPlaceTimeTableFilterComposer
    extends Composer<_$AppDatabase, $AlertPlaceTimeTable> {
  $$AlertPlaceTimeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daysMask => $composableBuilder(
    column: $table.daysMask,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  $$AlertsTableFilterComposer get alertId {
    final $$AlertsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableFilterComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlacesTableFilterComposer get placeId {
    final $$PlacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableFilterComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertPlaceTimeTableOrderingComposer
    extends Composer<_$AppDatabase, $AlertPlaceTimeTable> {
  $$AlertPlaceTimeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daysMask => $composableBuilder(
    column: $table.daysMask,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  $$AlertsTableOrderingComposer get alertId {
    final $$AlertsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableOrderingComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlacesTableOrderingComposer get placeId {
    final $$PlacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableOrderingComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertPlaceTimeTableAnnotationComposer
    extends Composer<_$AppDatabase, $AlertPlaceTimeTable> {
  $$AlertPlaceTimeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get radius =>
      $composableBuilder(column: $table.radius, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get daysMask =>
      $composableBuilder(column: $table.daysMask, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  $$AlertsTableAnnotationComposer get alertId {
    final $$AlertsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.alertId,
      referencedTable: $db.alerts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AlertsTableAnnotationComposer(
            $db: $db,
            $table: $db.alerts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlacesTableAnnotationComposer get placeId {
    final $$PlacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableAnnotationComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AlertPlaceTimeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AlertPlaceTimeTable,
          AlertPlaceTimeData,
          $$AlertPlaceTimeTableFilterComposer,
          $$AlertPlaceTimeTableOrderingComposer,
          $$AlertPlaceTimeTableAnnotationComposer,
          $$AlertPlaceTimeTableCreateCompanionBuilder,
          $$AlertPlaceTimeTableUpdateCompanionBuilder,
          (AlertPlaceTimeData, $$AlertPlaceTimeTableReferences),
          AlertPlaceTimeData,
          PrefetchHooks Function({bool alertId, bool placeId})
        > {
  $$AlertPlaceTimeTableTableManager(
    _$AppDatabase db,
    $AlertPlaceTimeTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AlertPlaceTimeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AlertPlaceTimeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AlertPlaceTimeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> alertId = const Value.absent(),
                Value<int> placeId = const Value.absent(),
                Value<int?> radius = const Value.absent(),
                Value<String> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int> daysMask = const Value.absent(),
                Value<String> timezone = const Value.absent(),
              }) => AlertPlaceTimeCompanion(
                alertId: alertId,
                placeId: placeId,
                radius: radius,
                startTime: startTime,
                endTime: endTime,
                daysMask: daysMask,
                timezone: timezone,
              ),
          createCompanionCallback:
              ({
                Value<int> alertId = const Value.absent(),
                required int placeId,
                Value<int?> radius = const Value.absent(),
                required String startTime,
                Value<String?> endTime = const Value.absent(),
                Value<int> daysMask = const Value.absent(),
                Value<String> timezone = const Value.absent(),
              }) => AlertPlaceTimeCompanion.insert(
                alertId: alertId,
                placeId: placeId,
                radius: radius,
                startTime: startTime,
                endTime: endTime,
                daysMask: daysMask,
                timezone: timezone,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AlertPlaceTimeTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({alertId = false, placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (alertId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.alertId,
                                referencedTable: $$AlertPlaceTimeTableReferences
                                    ._alertIdTable(db),
                                referencedColumn:
                                    $$AlertPlaceTimeTableReferences
                                        ._alertIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable: $$AlertPlaceTimeTableReferences
                                    ._placeIdTable(db),
                                referencedColumn:
                                    $$AlertPlaceTimeTableReferences
                                        ._placeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AlertPlaceTimeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AlertPlaceTimeTable,
      AlertPlaceTimeData,
      $$AlertPlaceTimeTableFilterComposer,
      $$AlertPlaceTimeTableOrderingComposer,
      $$AlertPlaceTimeTableAnnotationComposer,
      $$AlertPlaceTimeTableCreateCompanionBuilder,
      $$AlertPlaceTimeTableUpdateCompanionBuilder,
      (AlertPlaceTimeData, $$AlertPlaceTimeTableReferences),
      AlertPlaceTimeData,
      PrefetchHooks Function({bool alertId, bool placeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AlertsTableTableManager get alerts =>
      $$AlertsTableTableManager(_db, _db.alerts);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$AlertCategoryTableTableManager get alertCategory =>
      $$AlertCategoryTableTableManager(_db, _db.alertCategory);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db, _db.places);
  $$AlertPlaceTimeTableTableManager get alertPlaceTime =>
      $$AlertPlaceTimeTableTableManager(_db, _db.alertPlaceTime);
}
