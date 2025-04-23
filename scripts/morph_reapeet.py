import xml.etree.ElementTree as ET
from collections import Counter

xml_path = 'scripts/Lexicon_valerijs.xml'

print("Чтение XML...")
tree = ET.parse(xml_path)
root = tree.getroot()

# Сбор всех ID
all_ids = []

for lexeme in root.iter('Lexeme'):
    lexeme_id = lexeme.attrib.get('ID')
    if lexeme_id:
        all_ids.append(int(lexeme_id))

# Подсчет количества каждой ID
counter = Counter(all_ids)

# Оставить только те ID, которые встречаются более одного раза
duplicates = [item for item, count in counter.items() if count > 1]

if not duplicates:
    print("✅ Повторяющихся ID нет. Всё чисто!")
else:
    print(f"❗ Найдено {len(duplicates)} повторяющихся ID:")
    for dup_id in duplicates:
        print(f"ID {dup_id} встречается {counter[dup_id]} раз(а)")
