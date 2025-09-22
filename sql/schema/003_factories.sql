-- +goose Up
CREATE TABLE factories(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    tech_type TEXT CHECK(tech_type = 'basic'
        OR tech_type = 'low tech'
        OR tech_type = 'high tech'
        OR tech_type = 'advanced'
    ) NOT NULL DEFAULT 'basic',
    founding_cost INTEGER,
    min_PC INTEGER
);

CREATE TABLE factory_inputs(
    factory_id INTEGER REFERENCES factories(id),
    goods_id INTEGER REFERENCES goods_ref(id),
    quantity INTEGER NOT NULL DEFAULT 1 CHECK(quantity > 0),
    UNIQUE(factory_id,goods_id)
);

CREATE TABLE factory_outputs(
    factory_id INTEGER REFERENCES factories(id),
    goods_id INTEGER REFERENCES goods_ref(id),
    quantity INTEGER NOT NULL DEFAULT 1 CHECK(quantity > 0),
    UNIQUE(factory_id,goods_id)
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Gas Collector (type 1)',
    'basic',
    8275000,
    110
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Gas Collector (type 2)',
    'basic',
    9745000,
    138
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Gas Collector (type 3)',
    'basic',
    10060000,
    144
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Gas Collector (type 4)',
    'basic',
    8800000,
    120
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Crystal Farm',
    'basic',
    9150000,
    127
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Mineral Extractor',
    'basic',
    9500000,
    134
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Scrap Metal Trader',
    'basic',
    7750000,
    100
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Solar Power Plant',
    'basic',
    6875000,
    84
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Water Collector',
    'basic',
    7750000,
    100
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Plankton Collector',
    'basic',
    8625000,
    117
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Oil Refinery',
    'low tech',
    4950000,
    162
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Carbon Extractor (Corn)',
    'low tech',
    4806500,
    139
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Carbon Extractor (Rice)',
    'low tech',
    4915000,
    139
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Carbon Extractor (Wheat)',
    'low tech',
    4750500,
    139
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Carbon Extractor (Potatoes)',
    'low tech',
    4610500,
    139
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Rubber Factory',
    'low tech',
    4383000,
    163
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Plastic Manufacturer',
    'low tech',
    4022500,
    135
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Solar Cell Factory',
    'low tech',
    7015000,
    310
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Steel Factory (carbon)',
    'low tech',
    4715500,
    147
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Steel Factory (coal)',
    'low tech',
    4467000,
    110
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fuel Factory',
    'low tech',
    3732000,
    83
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Glass Manufacturer',
    'low tech',
    3956000,
    97
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Chemical Factory',
    'low tech',
    6112000,
    235
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fertilizer Factory (chemical)',
    'low tech',
    5135500,
    234
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fertilizer Factory (plankton)',
    'low tech',
    5198500,
    192
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'High Capacity Lens Factory',
    'low tech',
    7193500,
    304
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fish Farm',
    'low tech',
    4089000,
    98
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Plant Farm',
    'low tech',
    2290000,
    88
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Rice Farm',
    'low tech',
    2990000,
    99
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Wheat Farm',
    'low tech',
    2864000,
    95
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Corn Farm',
    'low tech',
    3480000,
    133
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Wood Farm',
    'low tech',
    4075000,
    156
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fruit Farm',
    'low tech',
    4040000,
    170
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Tea Farm',
    'low tech',
    4512500,
    206
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Vegetable Farm',
    'low tech',
    2920000,
    96
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Sheep Ranch (wheat)',
    'low tech',
    4631500,
    153
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Sheep Ranch (corn)',
    'low tech',
    4715500,
    153
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fungus Farm',
    'low tech',
    3679500,
    77
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Cattle Ranch (wheat)',
    'low tech',
    4554500,
    147
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Cattle Ranch (corn)',
    'low tech',
    5783000,
    161
);

INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Meat Factory',
    'low tech',
    5912500,
    228
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Dairy Farm',
    'low tech',
    6875000,
    246
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Fabric Factory',
    'low tech',
    5230000,
    177
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Paper Factory',
    'low tech',
    4390000,
    121
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Distillery',
    'low tech',
    11897500,
    611
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Food Bar Factory',
    'low tech',
    4600000,
    146
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Book Factory',
    'low tech',
    3571000,
    83
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Jewelry Manufacturer (Platinum)',
    'low tech',
    7890000,
    333
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Jewelry Manufacturer (Gold)',
    'low tech',
    7540000,
    333
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Electro Magnet Factory',
    'advanced',
    4428500,
    123
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Energy Inverter Factory',
    'advanced',
    7606500,
    322
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Servo Factory',
    'advanced',
    5275500,
    177
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Steek Tube Factory',
    'advanced',
    4614000,
    136
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Conductor Factory',
    'advanced',
    5671000,
    216
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Transformator Factory',
    'advanced',
    4421500,
    134
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Tools Factory',
    'advanced',
    4470500,
    138
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Semi Conductor Factory',
    'advanced',
    4278000,
    125
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Microchip Factory',
    'advanced',
    4460000,
    171
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Energy Tube Factory',
    'advanced',
    5219500,
    184
);
INSERT INTO factories(name,tech_type,founding_cost,min_PC) VALUES(
    'Plasma Cell Factory',
    'advanced',
    4250000,
    112
);
-- TODO continue adding entries
-- +goose Down
DROP TABLE factory_inputs;
DROP TABLE factory_outputs;
DROP TABLE factories;
