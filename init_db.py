# init_db.py
import sqlite3

DB_NAME = "risk_assessment.db"
borroDB_FILE = "borroDB.sql"

# connect to the database 
connection = sqlite3.connect(DB_NAME)

# Enable foreign key support
connection.execute("PRAGMA foreign_keys = 1")
#
# Read and execute the schema file
with open(borroDB_FILE) as f:
    connection.executescript(f.read())

print(f"Database '{DB_NAME}' created successfully.")

connection.commit()
connection.close()