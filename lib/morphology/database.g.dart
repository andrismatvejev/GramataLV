// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LexemesTable extends Lexemes with TableInfo<$LexemesTable, Lexeme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LexemesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stem1Meta = const VerificationMeta('stem1');
  @override
  late final GeneratedColumn<String> stem1 = GeneratedColumn<String>(
    'stem1',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _AvotsMeta = const VerificationMeta('Avots');
  @override
  late final GeneratedColumn<String> Avots = GeneratedColumn<String>(
    'avots',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _Darbibas_varda_tipsMeta =
      const VerificationMeta('Darbibas_varda_tips');
  @override
  late final GeneratedColumn<String> Darbibas_varda_tips =
      GeneratedColumn<String>(
        'darbibas_varda_tips',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _DeklinacijaMeta = const VerificationMeta(
    'Deklinacija',
  );
  @override
  late final GeneratedColumn<String> Deklinacija = GeneratedColumn<String>(
    'deklinacija',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _Lietvarda_tipsMeta = const VerificationMeta(
    'Lietvarda_tips',
  );
  @override
  late final GeneratedColumn<String> Lietvarda_tips = GeneratedColumn<String>(
    'lietvarda_tips',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _NoliegumsMeta = const VerificationMeta(
    'Noliegums',
  );
  @override
  late final GeneratedColumn<String> Noliegums = GeneratedColumn<String>(
    'noliegums',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _PamatformaMeta = const VerificationMeta(
    'Pamatforma',
  );
  @override
  late final GeneratedColumn<String> Pamatforma = GeneratedColumn<String>(
    'pamatforma',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _Reziduala_tipsMeta = const VerificationMeta(
    'Reziduala_tips',
  );
  @override
  late final GeneratedColumn<String> Reziduala_tips = GeneratedColumn<String>(
    'reziduala_tips',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _Skaitlis_2Meta = const VerificationMeta(
    'Skaitlis_2',
  );
  @override
  late final GeneratedColumn<String> Skaitlis_2 = GeneratedColumn<String>(
    'skaitlis_2',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _TransitivitateMeta = const VerificationMeta(
    'Transitivitate',
  );
  @override
  late final GeneratedColumn<String> Transitivitate = GeneratedColumn<String>(
    'transitivitate',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _VardskiraMeta = const VerificationMeta(
    'Vardskira',
  );
  @override
  late final GeneratedColumn<String> Vardskira = GeneratedColumn<String>(
    'vardskira',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _Ipasibas_varda_tipsMeta =
      const VerificationMeta('Ipasibas_varda_tips');
  @override
  late final GeneratedColumn<String> Ipasibas_varda_tips =
      GeneratedColumn<String>(
        'ipasibas_varda_tips',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    stem1,
    Avots,
    Darbibas_varda_tips,
    Deklinacija,
    Lietvarda_tips,
    Noliegums,
    Pamatforma,
    Reziduala_tips,
    Skaitlis_2,
    Transitivitate,
    Vardskira,
    Ipasibas_varda_tips,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lexemes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lexeme> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stem1')) {
      context.handle(
        _stem1Meta,
        stem1.isAcceptableOrUnknown(data['stem1']!, _stem1Meta),
      );
    } else if (isInserting) {
      context.missing(_stem1Meta);
    }
    if (data.containsKey('avots')) {
      context.handle(
        _AvotsMeta,
        Avots.isAcceptableOrUnknown(data['avots']!, _AvotsMeta),
      );
    }
    if (data.containsKey('darbibas_varda_tips')) {
      context.handle(
        _Darbibas_varda_tipsMeta,
        Darbibas_varda_tips.isAcceptableOrUnknown(
          data['darbibas_varda_tips']!,
          _Darbibas_varda_tipsMeta,
        ),
      );
    }
    if (data.containsKey('deklinacija')) {
      context.handle(
        _DeklinacijaMeta,
        Deklinacija.isAcceptableOrUnknown(
          data['deklinacija']!,
          _DeklinacijaMeta,
        ),
      );
    }
    if (data.containsKey('lietvarda_tips')) {
      context.handle(
        _Lietvarda_tipsMeta,
        Lietvarda_tips.isAcceptableOrUnknown(
          data['lietvarda_tips']!,
          _Lietvarda_tipsMeta,
        ),
      );
    }
    if (data.containsKey('noliegums')) {
      context.handle(
        _NoliegumsMeta,
        Noliegums.isAcceptableOrUnknown(data['noliegums']!, _NoliegumsMeta),
      );
    }
    if (data.containsKey('pamatforma')) {
      context.handle(
        _PamatformaMeta,
        Pamatforma.isAcceptableOrUnknown(data['pamatforma']!, _PamatformaMeta),
      );
    }
    if (data.containsKey('reziduala_tips')) {
      context.handle(
        _Reziduala_tipsMeta,
        Reziduala_tips.isAcceptableOrUnknown(
          data['reziduala_tips']!,
          _Reziduala_tipsMeta,
        ),
      );
    }
    if (data.containsKey('skaitlis_2')) {
      context.handle(
        _Skaitlis_2Meta,
        Skaitlis_2.isAcceptableOrUnknown(data['skaitlis_2']!, _Skaitlis_2Meta),
      );
    }
    if (data.containsKey('transitivitate')) {
      context.handle(
        _TransitivitateMeta,
        Transitivitate.isAcceptableOrUnknown(
          data['transitivitate']!,
          _TransitivitateMeta,
        ),
      );
    }
    if (data.containsKey('vardskira')) {
      context.handle(
        _VardskiraMeta,
        Vardskira.isAcceptableOrUnknown(data['vardskira']!, _VardskiraMeta),
      );
    }
    if (data.containsKey('ipasibas_varda_tips')) {
      context.handle(
        _Ipasibas_varda_tipsMeta,
        Ipasibas_varda_tips.isAcceptableOrUnknown(
          data['ipasibas_varda_tips']!,
          _Ipasibas_varda_tipsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lexeme map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lexeme(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      stem1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}stem1'],
          )!,
      Avots: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avots'],
      ),
      Darbibas_varda_tips: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}darbibas_varda_tips'],
      ),
      Deklinacija: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deklinacija'],
      ),
      Lietvarda_tips: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lietvarda_tips'],
      ),
      Noliegums: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}noliegums'],
      ),
      Pamatforma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pamatforma'],
      ),
      Reziduala_tips: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reziduala_tips'],
      ),
      Skaitlis_2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skaitlis_2'],
      ),
      Transitivitate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transitivitate'],
      ),
      Vardskira: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vardskira'],
      ),
      Ipasibas_varda_tips: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ipasibas_varda_tips'],
      ),
    );
  }

  @override
  $LexemesTable createAlias(String alias) {
    return $LexemesTable(attachedDatabase, alias);
  }
}

class Lexeme extends DataClass implements Insertable<Lexeme> {
  final int id;
  final String stem1;
  final String? Avots;
  final String? Darbibas_varda_tips;
  final String? Deklinacija;
  final String? Lietvarda_tips;
  final String? Noliegums;
  final String? Pamatforma;
  final String? Reziduala_tips;
  final String? Skaitlis_2;
  final String? Transitivitate;
  final String? Vardskira;
  final String? Ipasibas_varda_tips;
  const Lexeme({
    required this.id,
    required this.stem1,
    this.Avots,
    this.Darbibas_varda_tips,
    this.Deklinacija,
    this.Lietvarda_tips,
    this.Noliegums,
    this.Pamatforma,
    this.Reziduala_tips,
    this.Skaitlis_2,
    this.Transitivitate,
    this.Vardskira,
    this.Ipasibas_varda_tips,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stem1'] = Variable<String>(stem1);
    if (!nullToAbsent || Avots != null) {
      map['avots'] = Variable<String>(Avots);
    }
    if (!nullToAbsent || Darbibas_varda_tips != null) {
      map['darbibas_varda_tips'] = Variable<String>(Darbibas_varda_tips);
    }
    if (!nullToAbsent || Deklinacija != null) {
      map['deklinacija'] = Variable<String>(Deklinacija);
    }
    if (!nullToAbsent || Lietvarda_tips != null) {
      map['lietvarda_tips'] = Variable<String>(Lietvarda_tips);
    }
    if (!nullToAbsent || Noliegums != null) {
      map['noliegums'] = Variable<String>(Noliegums);
    }
    if (!nullToAbsent || Pamatforma != null) {
      map['pamatforma'] = Variable<String>(Pamatforma);
    }
    if (!nullToAbsent || Reziduala_tips != null) {
      map['reziduala_tips'] = Variable<String>(Reziduala_tips);
    }
    if (!nullToAbsent || Skaitlis_2 != null) {
      map['skaitlis_2'] = Variable<String>(Skaitlis_2);
    }
    if (!nullToAbsent || Transitivitate != null) {
      map['transitivitate'] = Variable<String>(Transitivitate);
    }
    if (!nullToAbsent || Vardskira != null) {
      map['vardskira'] = Variable<String>(Vardskira);
    }
    if (!nullToAbsent || Ipasibas_varda_tips != null) {
      map['ipasibas_varda_tips'] = Variable<String>(Ipasibas_varda_tips);
    }
    return map;
  }

  LexemesCompanion toCompanion(bool nullToAbsent) {
    return LexemesCompanion(
      id: Value(id),
      stem1: Value(stem1),
      Avots:
          Avots == null && nullToAbsent ? const Value.absent() : Value(Avots),
      Darbibas_varda_tips:
          Darbibas_varda_tips == null && nullToAbsent
              ? const Value.absent()
              : Value(Darbibas_varda_tips),
      Deklinacija:
          Deklinacija == null && nullToAbsent
              ? const Value.absent()
              : Value(Deklinacija),
      Lietvarda_tips:
          Lietvarda_tips == null && nullToAbsent
              ? const Value.absent()
              : Value(Lietvarda_tips),
      Noliegums:
          Noliegums == null && nullToAbsent
              ? const Value.absent()
              : Value(Noliegums),
      Pamatforma:
          Pamatforma == null && nullToAbsent
              ? const Value.absent()
              : Value(Pamatforma),
      Reziduala_tips:
          Reziduala_tips == null && nullToAbsent
              ? const Value.absent()
              : Value(Reziduala_tips),
      Skaitlis_2:
          Skaitlis_2 == null && nullToAbsent
              ? const Value.absent()
              : Value(Skaitlis_2),
      Transitivitate:
          Transitivitate == null && nullToAbsent
              ? const Value.absent()
              : Value(Transitivitate),
      Vardskira:
          Vardskira == null && nullToAbsent
              ? const Value.absent()
              : Value(Vardskira),
      Ipasibas_varda_tips:
          Ipasibas_varda_tips == null && nullToAbsent
              ? const Value.absent()
              : Value(Ipasibas_varda_tips),
    );
  }

  factory Lexeme.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lexeme(
      id: serializer.fromJson<int>(json['id']),
      stem1: serializer.fromJson<String>(json['stem1']),
      Avots: serializer.fromJson<String?>(json['Avots']),
      Darbibas_varda_tips: serializer.fromJson<String?>(
        json['Darbibas_varda_tips'],
      ),
      Deklinacija: serializer.fromJson<String?>(json['Deklinacija']),
      Lietvarda_tips: serializer.fromJson<String?>(json['Lietvarda_tips']),
      Noliegums: serializer.fromJson<String?>(json['Noliegums']),
      Pamatforma: serializer.fromJson<String?>(json['Pamatforma']),
      Reziduala_tips: serializer.fromJson<String?>(json['Reziduala_tips']),
      Skaitlis_2: serializer.fromJson<String?>(json['Skaitlis_2']),
      Transitivitate: serializer.fromJson<String?>(json['Transitivitate']),
      Vardskira: serializer.fromJson<String?>(json['Vardskira']),
      Ipasibas_varda_tips: serializer.fromJson<String?>(
        json['Ipasibas_varda_tips'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stem1': serializer.toJson<String>(stem1),
      'Avots': serializer.toJson<String?>(Avots),
      'Darbibas_varda_tips': serializer.toJson<String?>(Darbibas_varda_tips),
      'Deklinacija': serializer.toJson<String?>(Deklinacija),
      'Lietvarda_tips': serializer.toJson<String?>(Lietvarda_tips),
      'Noliegums': serializer.toJson<String?>(Noliegums),
      'Pamatforma': serializer.toJson<String?>(Pamatforma),
      'Reziduala_tips': serializer.toJson<String?>(Reziduala_tips),
      'Skaitlis_2': serializer.toJson<String?>(Skaitlis_2),
      'Transitivitate': serializer.toJson<String?>(Transitivitate),
      'Vardskira': serializer.toJson<String?>(Vardskira),
      'Ipasibas_varda_tips': serializer.toJson<String?>(Ipasibas_varda_tips),
    };
  }

  Lexeme copyWith({
    int? id,
    String? stem1,
    Value<String?> Avots = const Value.absent(),
    Value<String?> Darbibas_varda_tips = const Value.absent(),
    Value<String?> Deklinacija = const Value.absent(),
    Value<String?> Lietvarda_tips = const Value.absent(),
    Value<String?> Noliegums = const Value.absent(),
    Value<String?> Pamatforma = const Value.absent(),
    Value<String?> Reziduala_tips = const Value.absent(),
    Value<String?> Skaitlis_2 = const Value.absent(),
    Value<String?> Transitivitate = const Value.absent(),
    Value<String?> Vardskira = const Value.absent(),
    Value<String?> Ipasibas_varda_tips = const Value.absent(),
  }) => Lexeme(
    id: id ?? this.id,
    stem1: stem1 ?? this.stem1,
    Avots: Avots.present ? Avots.value : this.Avots,
    Darbibas_varda_tips:
        Darbibas_varda_tips.present
            ? Darbibas_varda_tips.value
            : this.Darbibas_varda_tips,
    Deklinacija: Deklinacija.present ? Deklinacija.value : this.Deklinacija,
    Lietvarda_tips:
        Lietvarda_tips.present ? Lietvarda_tips.value : this.Lietvarda_tips,
    Noliegums: Noliegums.present ? Noliegums.value : this.Noliegums,
    Pamatforma: Pamatforma.present ? Pamatforma.value : this.Pamatforma,
    Reziduala_tips:
        Reziduala_tips.present ? Reziduala_tips.value : this.Reziduala_tips,
    Skaitlis_2: Skaitlis_2.present ? Skaitlis_2.value : this.Skaitlis_2,
    Transitivitate:
        Transitivitate.present ? Transitivitate.value : this.Transitivitate,
    Vardskira: Vardskira.present ? Vardskira.value : this.Vardskira,
    Ipasibas_varda_tips:
        Ipasibas_varda_tips.present
            ? Ipasibas_varda_tips.value
            : this.Ipasibas_varda_tips,
  );
  Lexeme copyWithCompanion(LexemesCompanion data) {
    return Lexeme(
      id: data.id.present ? data.id.value : this.id,
      stem1: data.stem1.present ? data.stem1.value : this.stem1,
      Avots: data.Avots.present ? data.Avots.value : this.Avots,
      Darbibas_varda_tips:
          data.Darbibas_varda_tips.present
              ? data.Darbibas_varda_tips.value
              : this.Darbibas_varda_tips,
      Deklinacija:
          data.Deklinacija.present ? data.Deklinacija.value : this.Deklinacija,
      Lietvarda_tips:
          data.Lietvarda_tips.present
              ? data.Lietvarda_tips.value
              : this.Lietvarda_tips,
      Noliegums: data.Noliegums.present ? data.Noliegums.value : this.Noliegums,
      Pamatforma:
          data.Pamatforma.present ? data.Pamatforma.value : this.Pamatforma,
      Reziduala_tips:
          data.Reziduala_tips.present
              ? data.Reziduala_tips.value
              : this.Reziduala_tips,
      Skaitlis_2:
          data.Skaitlis_2.present ? data.Skaitlis_2.value : this.Skaitlis_2,
      Transitivitate:
          data.Transitivitate.present
              ? data.Transitivitate.value
              : this.Transitivitate,
      Vardskira: data.Vardskira.present ? data.Vardskira.value : this.Vardskira,
      Ipasibas_varda_tips:
          data.Ipasibas_varda_tips.present
              ? data.Ipasibas_varda_tips.value
              : this.Ipasibas_varda_tips,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lexeme(')
          ..write('id: $id, ')
          ..write('stem1: $stem1, ')
          ..write('Avots: $Avots, ')
          ..write('Darbibas_varda_tips: $Darbibas_varda_tips, ')
          ..write('Deklinacija: $Deklinacija, ')
          ..write('Lietvarda_tips: $Lietvarda_tips, ')
          ..write('Noliegums: $Noliegums, ')
          ..write('Pamatforma: $Pamatforma, ')
          ..write('Reziduala_tips: $Reziduala_tips, ')
          ..write('Skaitlis_2: $Skaitlis_2, ')
          ..write('Transitivitate: $Transitivitate, ')
          ..write('Vardskira: $Vardskira, ')
          ..write('Ipasibas_varda_tips: $Ipasibas_varda_tips')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    stem1,
    Avots,
    Darbibas_varda_tips,
    Deklinacija,
    Lietvarda_tips,
    Noliegums,
    Pamatforma,
    Reziduala_tips,
    Skaitlis_2,
    Transitivitate,
    Vardskira,
    Ipasibas_varda_tips,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lexeme &&
          other.id == this.id &&
          other.stem1 == this.stem1 &&
          other.Avots == this.Avots &&
          other.Darbibas_varda_tips == this.Darbibas_varda_tips &&
          other.Deklinacija == this.Deklinacija &&
          other.Lietvarda_tips == this.Lietvarda_tips &&
          other.Noliegums == this.Noliegums &&
          other.Pamatforma == this.Pamatforma &&
          other.Reziduala_tips == this.Reziduala_tips &&
          other.Skaitlis_2 == this.Skaitlis_2 &&
          other.Transitivitate == this.Transitivitate &&
          other.Vardskira == this.Vardskira &&
          other.Ipasibas_varda_tips == this.Ipasibas_varda_tips);
}

class LexemesCompanion extends UpdateCompanion<Lexeme> {
  final Value<int> id;
  final Value<String> stem1;
  final Value<String?> Avots;
  final Value<String?> Darbibas_varda_tips;
  final Value<String?> Deklinacija;
  final Value<String?> Lietvarda_tips;
  final Value<String?> Noliegums;
  final Value<String?> Pamatforma;
  final Value<String?> Reziduala_tips;
  final Value<String?> Skaitlis_2;
  final Value<String?> Transitivitate;
  final Value<String?> Vardskira;
  final Value<String?> Ipasibas_varda_tips;
  const LexemesCompanion({
    this.id = const Value.absent(),
    this.stem1 = const Value.absent(),
    this.Avots = const Value.absent(),
    this.Darbibas_varda_tips = const Value.absent(),
    this.Deklinacija = const Value.absent(),
    this.Lietvarda_tips = const Value.absent(),
    this.Noliegums = const Value.absent(),
    this.Pamatforma = const Value.absent(),
    this.Reziduala_tips = const Value.absent(),
    this.Skaitlis_2 = const Value.absent(),
    this.Transitivitate = const Value.absent(),
    this.Vardskira = const Value.absent(),
    this.Ipasibas_varda_tips = const Value.absent(),
  });
  LexemesCompanion.insert({
    this.id = const Value.absent(),
    required String stem1,
    this.Avots = const Value.absent(),
    this.Darbibas_varda_tips = const Value.absent(),
    this.Deklinacija = const Value.absent(),
    this.Lietvarda_tips = const Value.absent(),
    this.Noliegums = const Value.absent(),
    this.Pamatforma = const Value.absent(),
    this.Reziduala_tips = const Value.absent(),
    this.Skaitlis_2 = const Value.absent(),
    this.Transitivitate = const Value.absent(),
    this.Vardskira = const Value.absent(),
    this.Ipasibas_varda_tips = const Value.absent(),
  }) : stem1 = Value(stem1);
  static Insertable<Lexeme> custom({
    Expression<int>? id,
    Expression<String>? stem1,
    Expression<String>? Avots,
    Expression<String>? Darbibas_varda_tips,
    Expression<String>? Deklinacija,
    Expression<String>? Lietvarda_tips,
    Expression<String>? Noliegums,
    Expression<String>? Pamatforma,
    Expression<String>? Reziduala_tips,
    Expression<String>? Skaitlis_2,
    Expression<String>? Transitivitate,
    Expression<String>? Vardskira,
    Expression<String>? Ipasibas_varda_tips,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stem1 != null) 'stem1': stem1,
      if (Avots != null) 'avots': Avots,
      if (Darbibas_varda_tips != null)
        'darbibas_varda_tips': Darbibas_varda_tips,
      if (Deklinacija != null) 'deklinacija': Deklinacija,
      if (Lietvarda_tips != null) 'lietvarda_tips': Lietvarda_tips,
      if (Noliegums != null) 'noliegums': Noliegums,
      if (Pamatforma != null) 'pamatforma': Pamatforma,
      if (Reziduala_tips != null) 'reziduala_tips': Reziduala_tips,
      if (Skaitlis_2 != null) 'skaitlis_2': Skaitlis_2,
      if (Transitivitate != null) 'transitivitate': Transitivitate,
      if (Vardskira != null) 'vardskira': Vardskira,
      if (Ipasibas_varda_tips != null)
        'ipasibas_varda_tips': Ipasibas_varda_tips,
    });
  }

  LexemesCompanion copyWith({
    Value<int>? id,
    Value<String>? stem1,
    Value<String?>? Avots,
    Value<String?>? Darbibas_varda_tips,
    Value<String?>? Deklinacija,
    Value<String?>? Lietvarda_tips,
    Value<String?>? Noliegums,
    Value<String?>? Pamatforma,
    Value<String?>? Reziduala_tips,
    Value<String?>? Skaitlis_2,
    Value<String?>? Transitivitate,
    Value<String?>? Vardskira,
    Value<String?>? Ipasibas_varda_tips,
  }) {
    return LexemesCompanion(
      id: id ?? this.id,
      stem1: stem1 ?? this.stem1,
      Avots: Avots ?? this.Avots,
      Darbibas_varda_tips: Darbibas_varda_tips ?? this.Darbibas_varda_tips,
      Deklinacija: Deklinacija ?? this.Deklinacija,
      Lietvarda_tips: Lietvarda_tips ?? this.Lietvarda_tips,
      Noliegums: Noliegums ?? this.Noliegums,
      Pamatforma: Pamatforma ?? this.Pamatforma,
      Reziduala_tips: Reziduala_tips ?? this.Reziduala_tips,
      Skaitlis_2: Skaitlis_2 ?? this.Skaitlis_2,
      Transitivitate: Transitivitate ?? this.Transitivitate,
      Vardskira: Vardskira ?? this.Vardskira,
      Ipasibas_varda_tips: Ipasibas_varda_tips ?? this.Ipasibas_varda_tips,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stem1.present) {
      map['stem1'] = Variable<String>(stem1.value);
    }
    if (Avots.present) {
      map['avots'] = Variable<String>(Avots.value);
    }
    if (Darbibas_varda_tips.present) {
      map['darbibas_varda_tips'] = Variable<String>(Darbibas_varda_tips.value);
    }
    if (Deklinacija.present) {
      map['deklinacija'] = Variable<String>(Deklinacija.value);
    }
    if (Lietvarda_tips.present) {
      map['lietvarda_tips'] = Variable<String>(Lietvarda_tips.value);
    }
    if (Noliegums.present) {
      map['noliegums'] = Variable<String>(Noliegums.value);
    }
    if (Pamatforma.present) {
      map['pamatforma'] = Variable<String>(Pamatforma.value);
    }
    if (Reziduala_tips.present) {
      map['reziduala_tips'] = Variable<String>(Reziduala_tips.value);
    }
    if (Skaitlis_2.present) {
      map['skaitlis_2'] = Variable<String>(Skaitlis_2.value);
    }
    if (Transitivitate.present) {
      map['transitivitate'] = Variable<String>(Transitivitate.value);
    }
    if (Vardskira.present) {
      map['vardskira'] = Variable<String>(Vardskira.value);
    }
    if (Ipasibas_varda_tips.present) {
      map['ipasibas_varda_tips'] = Variable<String>(Ipasibas_varda_tips.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LexemesCompanion(')
          ..write('id: $id, ')
          ..write('stem1: $stem1, ')
          ..write('Avots: $Avots, ')
          ..write('Darbibas_varda_tips: $Darbibas_varda_tips, ')
          ..write('Deklinacija: $Deklinacija, ')
          ..write('Lietvarda_tips: $Lietvarda_tips, ')
          ..write('Noliegums: $Noliegums, ')
          ..write('Pamatforma: $Pamatforma, ')
          ..write('Reziduala_tips: $Reziduala_tips, ')
          ..write('Skaitlis_2: $Skaitlis_2, ')
          ..write('Transitivitate: $Transitivitate, ')
          ..write('Vardskira: $Vardskira, ')
          ..write('Ipasibas_varda_tips: $Ipasibas_varda_tips')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LexemesTable lexemes = $LexemesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [lexemes];
}

typedef $$LexemesTableCreateCompanionBuilder =
    LexemesCompanion Function({
      Value<int> id,
      required String stem1,
      Value<String?> Avots,
      Value<String?> Darbibas_varda_tips,
      Value<String?> Deklinacija,
      Value<String?> Lietvarda_tips,
      Value<String?> Noliegums,
      Value<String?> Pamatforma,
      Value<String?> Reziduala_tips,
      Value<String?> Skaitlis_2,
      Value<String?> Transitivitate,
      Value<String?> Vardskira,
      Value<String?> Ipasibas_varda_tips,
    });
typedef $$LexemesTableUpdateCompanionBuilder =
    LexemesCompanion Function({
      Value<int> id,
      Value<String> stem1,
      Value<String?> Avots,
      Value<String?> Darbibas_varda_tips,
      Value<String?> Deklinacija,
      Value<String?> Lietvarda_tips,
      Value<String?> Noliegums,
      Value<String?> Pamatforma,
      Value<String?> Reziduala_tips,
      Value<String?> Skaitlis_2,
      Value<String?> Transitivitate,
      Value<String?> Vardskira,
      Value<String?> Ipasibas_varda_tips,
    });

class $$LexemesTableFilterComposer
    extends Composer<_$AppDatabase, $LexemesTable> {
  $$LexemesTableFilterComposer({
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

  ColumnFilters<String> get stem1 => $composableBuilder(
    column: $table.stem1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Avots => $composableBuilder(
    column: $table.Avots,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Darbibas_varda_tips => $composableBuilder(
    column: $table.Darbibas_varda_tips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Deklinacija => $composableBuilder(
    column: $table.Deklinacija,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Lietvarda_tips => $composableBuilder(
    column: $table.Lietvarda_tips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Noliegums => $composableBuilder(
    column: $table.Noliegums,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Pamatforma => $composableBuilder(
    column: $table.Pamatforma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Reziduala_tips => $composableBuilder(
    column: $table.Reziduala_tips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Skaitlis_2 => $composableBuilder(
    column: $table.Skaitlis_2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Transitivitate => $composableBuilder(
    column: $table.Transitivitate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Vardskira => $composableBuilder(
    column: $table.Vardskira,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get Ipasibas_varda_tips => $composableBuilder(
    column: $table.Ipasibas_varda_tips,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LexemesTableOrderingComposer
    extends Composer<_$AppDatabase, $LexemesTable> {
  $$LexemesTableOrderingComposer({
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

  ColumnOrderings<String> get stem1 => $composableBuilder(
    column: $table.stem1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Avots => $composableBuilder(
    column: $table.Avots,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Darbibas_varda_tips => $composableBuilder(
    column: $table.Darbibas_varda_tips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Deklinacija => $composableBuilder(
    column: $table.Deklinacija,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Lietvarda_tips => $composableBuilder(
    column: $table.Lietvarda_tips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Noliegums => $composableBuilder(
    column: $table.Noliegums,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Pamatforma => $composableBuilder(
    column: $table.Pamatforma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Reziduala_tips => $composableBuilder(
    column: $table.Reziduala_tips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Skaitlis_2 => $composableBuilder(
    column: $table.Skaitlis_2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Transitivitate => $composableBuilder(
    column: $table.Transitivitate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Vardskira => $composableBuilder(
    column: $table.Vardskira,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get Ipasibas_varda_tips => $composableBuilder(
    column: $table.Ipasibas_varda_tips,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LexemesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LexemesTable> {
  $$LexemesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stem1 =>
      $composableBuilder(column: $table.stem1, builder: (column) => column);

  GeneratedColumn<String> get Avots =>
      $composableBuilder(column: $table.Avots, builder: (column) => column);

  GeneratedColumn<String> get Darbibas_varda_tips => $composableBuilder(
    column: $table.Darbibas_varda_tips,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Deklinacija => $composableBuilder(
    column: $table.Deklinacija,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Lietvarda_tips => $composableBuilder(
    column: $table.Lietvarda_tips,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Noliegums =>
      $composableBuilder(column: $table.Noliegums, builder: (column) => column);

  GeneratedColumn<String> get Pamatforma => $composableBuilder(
    column: $table.Pamatforma,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Reziduala_tips => $composableBuilder(
    column: $table.Reziduala_tips,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Skaitlis_2 => $composableBuilder(
    column: $table.Skaitlis_2,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Transitivitate => $composableBuilder(
    column: $table.Transitivitate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get Vardskira =>
      $composableBuilder(column: $table.Vardskira, builder: (column) => column);

  GeneratedColumn<String> get Ipasibas_varda_tips => $composableBuilder(
    column: $table.Ipasibas_varda_tips,
    builder: (column) => column,
  );
}

class $$LexemesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LexemesTable,
          Lexeme,
          $$LexemesTableFilterComposer,
          $$LexemesTableOrderingComposer,
          $$LexemesTableAnnotationComposer,
          $$LexemesTableCreateCompanionBuilder,
          $$LexemesTableUpdateCompanionBuilder,
          (Lexeme, BaseReferences<_$AppDatabase, $LexemesTable, Lexeme>),
          Lexeme,
          PrefetchHooks Function()
        > {
  $$LexemesTableTableManager(_$AppDatabase db, $LexemesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LexemesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LexemesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LexemesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> stem1 = const Value.absent(),
                Value<String?> Avots = const Value.absent(),
                Value<String?> Darbibas_varda_tips = const Value.absent(),
                Value<String?> Deklinacija = const Value.absent(),
                Value<String?> Lietvarda_tips = const Value.absent(),
                Value<String?> Noliegums = const Value.absent(),
                Value<String?> Pamatforma = const Value.absent(),
                Value<String?> Reziduala_tips = const Value.absent(),
                Value<String?> Skaitlis_2 = const Value.absent(),
                Value<String?> Transitivitate = const Value.absent(),
                Value<String?> Vardskira = const Value.absent(),
                Value<String?> Ipasibas_varda_tips = const Value.absent(),
              }) => LexemesCompanion(
                id: id,
                stem1: stem1,
                Avots: Avots,
                Darbibas_varda_tips: Darbibas_varda_tips,
                Deklinacija: Deklinacija,
                Lietvarda_tips: Lietvarda_tips,
                Noliegums: Noliegums,
                Pamatforma: Pamatforma,
                Reziduala_tips: Reziduala_tips,
                Skaitlis_2: Skaitlis_2,
                Transitivitate: Transitivitate,
                Vardskira: Vardskira,
                Ipasibas_varda_tips: Ipasibas_varda_tips,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String stem1,
                Value<String?> Avots = const Value.absent(),
                Value<String?> Darbibas_varda_tips = const Value.absent(),
                Value<String?> Deklinacija = const Value.absent(),
                Value<String?> Lietvarda_tips = const Value.absent(),
                Value<String?> Noliegums = const Value.absent(),
                Value<String?> Pamatforma = const Value.absent(),
                Value<String?> Reziduala_tips = const Value.absent(),
                Value<String?> Skaitlis_2 = const Value.absent(),
                Value<String?> Transitivitate = const Value.absent(),
                Value<String?> Vardskira = const Value.absent(),
                Value<String?> Ipasibas_varda_tips = const Value.absent(),
              }) => LexemesCompanion.insert(
                id: id,
                stem1: stem1,
                Avots: Avots,
                Darbibas_varda_tips: Darbibas_varda_tips,
                Deklinacija: Deklinacija,
                Lietvarda_tips: Lietvarda_tips,
                Noliegums: Noliegums,
                Pamatforma: Pamatforma,
                Reziduala_tips: Reziduala_tips,
                Skaitlis_2: Skaitlis_2,
                Transitivitate: Transitivitate,
                Vardskira: Vardskira,
                Ipasibas_varda_tips: Ipasibas_varda_tips,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LexemesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LexemesTable,
      Lexeme,
      $$LexemesTableFilterComposer,
      $$LexemesTableOrderingComposer,
      $$LexemesTableAnnotationComposer,
      $$LexemesTableCreateCompanionBuilder,
      $$LexemesTableUpdateCompanionBuilder,
      (Lexeme, BaseReferences<_$AppDatabase, $LexemesTable, Lexeme>),
      Lexeme,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LexemesTableTableManager get lexemes =>
      $$LexemesTableTableManager(_db, _db.lexemes);
}
