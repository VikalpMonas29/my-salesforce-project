import json
import os

MAPPING_FILE = "TestClassesMapping.json"
CHANGED_CLASSES_FILE = "changed_apex_classes.txt"

if not os.path.exists(CHANGED_CLASSES_FILE):
    print("No Apex class changes detected.")
    exit(0)

with open(CHANGED_CLASSES_FILE, "r") as f:
    changed_classes = [line.strip() for line in f if line.strip()]

if not changed_classes:
    print("No Apex class changes detected.")
    exit(0)

with open(MAPPING_FILE, "r") as f:
    mapping = json.load(f)

tests_to_run = set()

for apex_class in changed_classes:
    if apex_class in mapping:
        for test in mapping[apex_class]:
            tests_to_run.add(test)

if not tests_to_run:
    print("No matching tests found.")
    exit(0)

tests_str = " ".join(sorted(tests_to_run))

with open(os.environ["GITHUB_ENV"], "a") as env:
    env.write(f"TESTS_TO_RUN={tests_str}\n")

print(f"Tests to run: {tests_str}")