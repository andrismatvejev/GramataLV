import sqlite3
import xml.etree.ElementTree as ET
import os

def normalize_field_name(field):
    return (field
            .replace('ā', 'a').replace('Ā', 'A')
            .replace('ī', 'i').replace('Ī', 'I')
            .replace('ē', 'e').replace('Ē', 'E')
            .replace('ū', 'u').replace('Ū', 'U')
            .replace('ķ', 'k').replace('Ķ', 'K')
            .replace('ļ', 'l').replace('Ļ', 'L')
            .replace('ņ', 'n').replace('Ņ', 'N')
            .replace('ģ', 'g').replace('Ģ', 'G')
            .replace('š', 's').replace('Š', 'S')
            .replace('ž', 'z').replace('Ž', 'Z')
            .replace('č', 'c').replace('Č', 'C'))

# === НАСТРОЙКИ ===
LEXICON_XML_PATH = "scripts/Lexicon_valerijs.xml"  # Путь до XML файла
OUTPUT_DB_PATH = "scripts/lexicon.db"  # Куда сохранить SQLite базу

# === ШАГ 1. Чтение XML и поиск всех уникальных полей ===
print("Чтение XML...")

tree = ET.parse(LEXICON_XML_PATH)
root = tree.getroot()

# Создаем мапу: оригинальное имя -> нормализованное имя
field_mapping = {}

for lexeme in root.iter('Lexeme'):
    id_str = lexeme.attrib.get('ID')
    if id_str is None:
        continue
    attributes = lexeme.find('Attributes')
    if attributes is not None:
        for key in attributes.attrib.keys():
            field_mapping[key] = normalize_field_name(key)

# Сортируем по нормализованным именам
sorted_fields = sorted(field_mapping.items(), key=lambda x: x[1])
original_fields = [orig for orig, norm in sorted_fields]
normalized_fields = [norm for orig, norm in sorted_fields]

print(f"Найдено уникальных полей: {len(normalized_fields)}")
print(normalized_fields)

# === ШАГ 2. Создание базы данных и таблицы ===
print("Создание базы данных...")

if os.path.exists(OUTPUT_DB_PATH):
    os.remove(OUTPUT_DB_PATH)

conn = sqlite3.connect(OUTPUT_DB_PATH)
cursor = conn.cursor()

columns_sql = ",\n".join([f'"{field}" TEXT' for field in normalized_fields])

create_table_sql = f"""
CREATE TABLE lexemes (
    id INTEGER PRIMARY KEY,
    stem1 TEXT,
    {columns_sql}
);
"""

cursor.execute(create_table_sql)
conn.commit()

# === ШАГ 3. Заполнение базы данных ===
print("Заполнение базы данных...")

insert_sql = f"""
INSERT INTO lexemes (id, stem1, {', '.join(f'"{field}"' for field in normalized_fields)})
VALUES ({', '.join(['?'] * (2 + len(normalized_fields)))})
"""

count = 0

for lexeme in root.iter('Lexeme'):
    id_str = lexeme.attrib.get('ID')
    if id_str is None:
        continue
    lexeme_id = int(id_str)
    stem1 = lexeme.attrib.get('Stem1', '')

    attributes = lexeme.find('Attributes')
    values = []
    if attributes is not None:
        for original_field in original_fields:
            value = attributes.attrib.get(original_field)
            values.append(value)
    else:
        values = [None] * len(original_fields)

    cursor.execute(insert_sql, (lexeme_id, stem1, *values))
    count += 1

conn.commit()
conn.close()

print(f"✅ Готово! Сохранено {count} записей в '{OUTPUT_DB_PATH}'.")
