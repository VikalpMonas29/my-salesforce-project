import os
import re
import json
CLASSES_PATH = "force-app/main/default/classes"
OUTPUT_FILE = "scripts/output/TestClassesMapping.json"
IS_TEST_REGEX = re.compile(r'@isTest', re.IGNORECASE)
# ---------------------------------------
apex_files = [f for f in os.listdir(CLASSES_PATH) if f.endswith(".cls")]
# ---------------------------------------
# Step 1: Collect real non-test Apex classes (from filenames)
prod_classes = set()
for file in apex_files:
    path = os.path.join(CLASSES_PATH, file)
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    if IS_TEST_REGEX.search(content):
        continue
    prod_classes.add(os.path.splitext(file)[0])
# ---------------------------------------
# Step 2: Build mapping
mapping = {}
for file in apex_files:
    path = os.path.join(CLASSES_PATH, file)
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    if not IS_TEST_REGEX.search(content):
        continue
    test_class = os.path.splitext(file)[0]
    matched_prod = set()
    # Case 1: Explicit references
    for prod in prod_classes:
        if re.search(rf'\bnew\s+{prod}\b', content) or \
           re.search(rf'\b{prod}\.', content):
            matched_prod.add(prod)
    # Case 2: Name-based (Test, Test2, etc.)
    for prod in prod_classes:
        if test_class.startswith(prod) and "Test" in test_class:
            matched_prod.add(prod)
    for prod in matched_prod:
        mapping.setdefault(prod, []).append(test_class)
# ---------------------------------------
# Step 3: De-duplicate & sort
for prod in mapping:
    mapping[prod] = sorted(set(mapping[prod]))
# ---------------------------------------
# Step 4: Write JSON safely
output_dir = os.path.dirname(OUTPUT_FILE)
os.makedirs(output_dir, exist_ok=True)
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write("{\n")
    items = list(mapping.items())
    for index, (prod, tests) in enumerate(items):
        line = f'  "{prod}": {json.dumps(tests)}'
        if index < len(items) - 1:
            line += ","
        f.write(line + "\n")
    f.write("}\n")
print("✅ TestClassesMapping.json generated successfully")
print(f"📦 Total prod classes mapped: {len(mapping)}")