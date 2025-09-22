-- +goose Up
PRAGMA foreign_keys=ON;
CREATE TABLE systems(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    x INTEGER NOT NULL CHECK(x > -500 AND x <= 500),
    y INTEGER NOT NULL CHECK(y > -500 AND y <= 500),
    UNIQUE(x,y)
);

-- +goose Down
PRAGMA foreign_keys=OFF;
DROP TABLE systems;
