
-- Defines the database structure based on the project's ER diagram.

CREATE TABLE LOCATION (
    LocationID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Coordinates TEXT NOT NULL,
    Region TEXT,
    Description TEXT
);

CREATE TABLE EVENT (
    EventID INTEGER PRIMARY KEY AUTOINCREMENT,
    LocationID INTEGER NOT NULL,
    EventType TEXT NOT NULL,
    Severity REAL,
    DateObserved TEXT,
    FOREIGN KEY (LocationID) REFERENCES LOCATION (LocationID)
);

CREATE TABLE LOCAL_LORE (
    LoreID INTEGER PRIMARY KEY AUTOINCREMENT,
    LocationID INTEGER NOT NULL,
    Narrative TEXT NOT NULL,
    Source TEXT,
    CredibilityRating REAL,
    FOREIGN KEY (LocationID) REFERENCES LOCATION (LocationID)
);

CREATE TABLE VULNERABILITY (
    VulnerabilityID INTEGER PRIMARY KEY AUTOINCREMENT,
    LocationID INTEGER NOT NULL,
    AssetType TEXT NOT NULL,
    ExposureLevel REAL,
    CriticalityScore REAL,
    FOREIGN KEY (LocationID) REFERENCES LOCATION (LocationID)
);

CREATE TABLE RISK (
    RiskID INTEGER PRIMARY KEY AUTOINCREMENT,
    LocationID INTEGER NOT NULL,
    H_Score REAL NOT NULL,
    L_Score REAL NOT NULL,
    V_Score REAL NOT NULL,
    Probability REAL,
    Impact REAL,
    OverallScore REAL NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES LOCATION (LocationID)
);