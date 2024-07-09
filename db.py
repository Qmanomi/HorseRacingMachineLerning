import sqlite3

conn = sqlite3.connect("HRML.db")

cursor = conn.cursor()

# 外部キー制約有効化
cursor.execute("PRAGMA foreign_keys = true")

with open(file="create_table.sql", mode="r", encoding="utf-8") as file:
    sql_script = file.read()
    cursor.executescript(sql_script)
conn.commit()

cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
data = cursor.fetchall()
print(data)

conn.close()
