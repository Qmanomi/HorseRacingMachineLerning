-- テーブル作成
CREATE TABLE IF NOT EXISTS Farms (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Owners (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Uniform BLOB
);
CREATE TABLE IF NOT EXISTS Trainers (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Belong TEXT NOT NULL CHECK (
        Belong IN (
            'Miho',
            'Ritto',
            'Oi',
            'Urawa',
            'Kawasaki',
            'Hunabashi',
            'Monbetsu',
            'Morioka',
            'Kanazawa',
            'Fukushima',
            'Nagoya',
            'Kasamatsu',
            'Sonoda',
            'Kochi',
            'Saga',
            'Obihiro'
        )
    ),
    IsActive INTEGER NOT NULL CHECK (IsActive IN (0, 1)),
    JockeyID INTEGER,
    FOREIGN KEY (JockeyID) REFERENCES Jockeys(ID)
);
CREATE TABLE IF NOT EXISTS Jockeys (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Belong TEXT NOT NULL CHECK (
        Belong IN (
            'Miho',
            'Ritto',
            'Oi',
            'Urawa',
            'Kawasaki',
            'Hunabashi',
            'Monbetsu',
            'Morioka',
            'Kanazawa',
            'Fukushima',
            'Nagoya',
            'Kasamatsu',
            'Sonoda',
            'Kochi',
            'Saga',
            'Obihiro'
        )
    ),
    BirthYear INTEGER NOT NULL,
    IsActive INTEGER NOT NULL CHECK (IsActive IN (0, 1))
);
CREATE TABLE IF NOT EXISTS Horses (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Sex TEXT NOT NULL CHECK (Sex IN ('Male', 'Female', 'Gelding')),
    BirthYear INTEGER NOT NULL,
    Color TEXT NOT NULL CHECK (
        Color IN (
            'Bay',
            'Dark Bay',
            'Brown',
            'Black',
            'Chestnut',
            'Liver Chestnut',
            'Gray',
            'White'
        )
    ),
    FarmID INTEGER NOT NULL,
    OwnerID INTEGER,
    TrainerID INTEGER,
    FatherID INTEGER,
    MotherID INTEGER,
    IsActive INTEGER NOT NULL CHECK (IsActive IN (0, 1)),
    FOREIGN KEY (FarmID) REFERENCES Farms(ID),
    FOREIGN KEY (OwnerID) REFERENCES Owners(ID),
    FOREIGN KEY (TrainerID) REFERENCES Trainers(ID),
    FOREIGN KEY (FatherID) REFERENCES Horses(ID),
    FOREIGN KEY (MotherID) REFERENCES Horses(ID)
);