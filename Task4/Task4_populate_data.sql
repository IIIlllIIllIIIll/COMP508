TRUNCATE TABLE role_history;
TRUNCATE TABLE contract;
TRUNCATE TABLE contractor;
TRUNCATE TABLE staff;
TRUNCATE TABLE project_road;
TRUNCATE TABLE project;
TRUNCATE TABLE role;
TRUNCATE TABLE road;
TRUNCATE TABLE location;
TRUNCATE TABLE category;

-- insert category
INSERT INTO category VALUES (
    'cat_1', 'National (high volume)'
);

INSERT INTO category VALUES (
    'cat_2', 'National'
);

INSERT INTO category VALUES (
    'cat_3', 'Regional'
);

INSERT INTO category VALUES (
    'cat_4', 'Arterial'
);

INSERT INTO category VALUES (
    'cat_5', 'Primary collector'
);

INSERT INTO category VALUES (
    'cat_6', 'Secondary collector'
);

INSERT INTO category VALUES (
    'cat_7', 'Access'
);

INSERT INTO category VALUES (
    'cat_8', 'Access (low-volume)'
);

INSERT INTO category VALUES (
    'cat_9', 'Not applicable'
);

-- insert location
INSERT INTO location VALUES (
    'loc_1', 'Wellesley, Victoria, Halsey Street', - 36.848251, 174.756382, NULL
);

INSERT INTO location VALUES (
    'loc_2', 'Wellesley Street W/E', - 36.850850, 174.764493, NULL
);

INSERT INTO location VALUES (
    'loc_3', 'Wellesley Street E', - 36.856020, 174.769727, NULL
);

INSERT INTO location VALUES (
    'loc_4', 'Halsey, Jellicoe Street', - 36.841262, 174.758230, NULL
);

INSERT INTO location VALUES (
    'loc_5', 'Jellicoe Street', - 36.839688, 174.753947, NULL
);

INSERT INTO location VALUES (
    'loc_6', 'Hamer Street', - 36.836883, 174.758216, NULL
);

INSERT INTO location VALUES (
    'loc_7', 'Hamer Street', - 36.840344, 174.754917, NULL
);

INSERT INTO location VALUES (
    'loc_8', 'Brigham Street', - 36.836883, 174.759736, NULL
);

INSERT INTO location VALUES (
    'loc_9', 'Brigham Street', - 36.840638, 174.755966, NULL
);

-- insert road
INSERT INTO road VALUES (
    'road_1', 'Wellesley Street', NULL, 'cat_5', NULL, 1500, 'loc_1', 'loc_3'
);

INSERT INTO road VALUES (
    'road_2', 'Wellesley Street West', NULL, 'cat_5', 'road_1', 750, 'loc_1', 'loc_2'
);

INSERT INTO road VALUES (
    'road_3', 'Wellesley Street East', NULL, 'cat_5', 'road_1', 750, 'loc_2', 'loc_3'
);

INSERT INTO road VALUES (
    'road_4', 'Halsey Street', NULL, 'cat_6', NULL, 800, 'loc_1', 'loc_4'
);

INSERT INTO road VALUES (
    'road_5', 'Jellicoe Street', NULL, 'cat_6', NULL, 500, 'loc_4', 'loc_5'
);

INSERT INTO road VALUES (
    'road_6', 'Hamer Street', NULL, 'cat_6', NULL, 500, 'loc_6', 'loc_7'
);

INSERT INTO road VALUES (
    'road_7', 'Brigham Street', NULL, 'cat_6', NULL, 550, 'loc_8', 'loc_9'
);

-- insert role
INSERT INTO role VALUES (
    'role_1', 'manager', NULL
);

INSERT INTO role VALUES (
    'role_2', 'worker', NULL
);

INSERT INTO role VALUES (
    'role_3', 'officer', NULL
);

INSERT INTO role VALUES (
    'role_4', 'inspector', NULL
);

INSERT INTO role VALUES (
    'role_5', 'equipment operator', NULL
);

-- insert project
INSERT INTO project VALUES (
    'pro_1', 'Wellesley St E maintenance', 'long term', '08-oct-2000', NULL
);

INSERT INTO project VALUES (
    'pro_2', 'Wellesley St and Halsey St upgrade', 'fix term', '08-oct-2020', '08-oct-2021'
);

INSERT INTO project VALUES (
    'pro_3', 'Jellicoe St maintenance', 'long term', '08-oct-2020', NULL
);

INSERT INTO project VALUES (
    'pro_4', 'Wellesley St W maintenance', 'long term', '08-oct-2019', NULL
);

INSERT INTO project VALUES (
    'pro_5', 'Halsey St maintenance', 'long term', '08-oct-2015', NULL
);

-- insert project_road
INSERT INTO project_road VALUES (
    'pro_1', 'road_3'
);

INSERT INTO project_road VALUES (
    'pro_2', 'road_1'
);

INSERT INTO project_road VALUES (
    'pro_2', 'road_4'
);

INSERT INTO project_road VALUES (
    'pro_3', 'road_5'
);

INSERT INTO project_road VALUES (
    'pro_4', 'road_2'
);

INSERT INTO project_road VALUES (
    'pro_5', 'road_4'
);

-- insert staff
INSERT INTO staff VALUES (
    'sta_1', 'Geraint', 'Astghik', '10-oct-2022', '10-oct-1980', 'not applicable', '601 Blockhouse Bay Road', 'Blockhouse Bay', 'Auckland'
    , 'New Zealand', '0600', '0227770088', 'geraint@autuni.ac.nz'
);

INSERT INTO staff VALUES (
    'sta_2', 'Athena', 'Youssef', '31-jan-2000', '23-sep-1967', 'male', '652 Dominion Road', 'Mount Eden', 'Auckland', 'New Zealand',
    '1041', '0214567890', 'athena@a.really.long.email.com'
);

INSERT INTO staff VALUES (
    'sta_3', 'Kiara', 'Theodor', '1-jan-2010', '12-aug-1990', 'female', '1010 Beach Road', 'Torbay', 'Auckland', 'New Zealand', '0630'
    , '0219877890', 'kiara@x.com'
);

INSERT INTO staff VALUES (
    'sta_4', 'Abigail', 'Lennox', '31-jan-1990', '8-jan-1969', 'not known', '324 Blockhouse Bay Road', 'Avondale', 'Auckland', 'New Zealand'
    , '0600', '0234567890', 'a@a.com'
);

INSERT INTO staff VALUES (
    'sta_5', 'Jumanah', 'Samaha', '31-jan-2018', '13-mar-1985', 'male', '982 Beach Road', 'Torbay', 'Auckland', 'New Zealand', '0630'
    , '0294567890', 'jumanah@gmail.com'
);

INSERT INTO staff VALUES (
    'sta_6', 'Lee', 'Liao', '31-jan-2020', '23-oct-1990', 'female', '630 Dominion Road', 'Mount Eden', 'Auckland', 'New Zealand', '1041'
    , '0214892890', 'lee@autuni.ac.nz'
);

-- insert contractor
INSERT INTO contractor VALUES (
    'conor_1', 'Big company', '321 Forest Hill Road', 'Waiatarua', 'Auckland', 'New Zealand', '0612', '+61092851538368', 'contractor@bigcompany.co.au'
);

INSERT INTO contractor VALUES (
    'conor_2', 'Small company', '31 McDowall Street', NULL, 'Forest Glen', 'Australia', '4556', '+61092851538368', 'contractor@great.co.au'
);

INSERT INTO contractor VALUES (
    'conor_3', 'AUT student company', '432 Don Buck Road', 'Massey', 'Auckland', 'New Zealand', '0614', '025873620', 'contractor@aut.ac.nz'
);

INSERT INTO contractor VALUES (
    'conor_4', 'Auckland construct', '928 Beach Road', 'Waiake', 'Auckland', 'New Zealand', '0630', '+61092851538368', 'contractor@great.co.au'
);

INSERT INTO contractor VALUES (
    'conor_5', 'NZ build', '130 Adelaide Road', 'Mount Cook', 'Wellington', 'New Zealand', '6021', '0279239875', 'contractor@nz.co.au'
);

--insert contract
INSERT INTO contract VALUES (
    'conct_1', 'conor_1', 'pro_1', 'sta_1', 'Big contract', NULL, 97654, 90000, '08-oct-2000', '08-oct-2001'
);

INSERT INTO contract VALUES (
    'conct_2', 'conor_2', 'pro_1', 'sta_1', 'Small contract', NULL, 1234, NULL, '08-oct-2001', NULL
);

INSERT INTO contract VALUES (
    'conct_3', 'conor_5', 'pro_2', 'sta_3', 'Wellesley St and Halsey St upgrade contract', NULL, 77995, 98756, '08-oct-2020', '08-oct-2021'
);

INSERT INTO contract VALUES (
    'conct_4', 'conor_5', 'pro_3', 'sta_4', 'Jellicoe St maintenance contract', NULL, 51265, 43215, '08-oct-2020', '08-oct-2021'
);

INSERT INTO contract VALUES (
    'conct_5', 'conor_2', 'pro_3', 'sta_4', 'Jellicoe St maintenance contract', NULL, 25123, NULL, '08-oct-2021', NULL
);

INSERT INTO contract VALUES (
    'conct_6', 'conor_3', 'pro_4', 'sta_5', 'Wellesley St W maintenance contract', NULL, 65132, NULL, '08-oct-2019', NULL
);

INSERT INTO contract VALUES (
    'conct_7', 'conor_3', 'pro_5', 'sta_6', 'Halsey St maintenance contract', NULL, 85612, NULL, '08-oct-2015', NULL
);

-- insert role_history
INSERT INTO role_history VALUES (
    'sta_1', '10-oct-2000', '10-dec-2000', 'role_2', 'promotion', 'conct_1'
);

INSERT INTO role_history VALUES (
    'sta_1', '10-dec-2000', '08-oct-2001', 'role_1', 'contract ends', 'conct_1'
);

INSERT INTO role_history VALUES (
    'sta_1', '08-oct-2001', NULL, 'role_1', NULL, 'conct_2'
);

INSERT INTO role_history VALUES (
    'sta_2', '08-oct-2000', '10-dec-2000', 'role_1', 'promotion', 'conct_1'
);

INSERT INTO role_history VALUES (
    'sta_2', '10-dec-2000', '08-oct-2001', 'role_3', 'contract ends', 'conct_1'
);

INSERT INTO role_history VALUES (
    'sta_2', '08-oct-2001', NULL, 'role_3', NULL, 'conct_2'
);

INSERT INTO role_history VALUES (
    'sta_3', '08-oct-2020', '08-oct-2021', 'role_1', 'contract ends', 'conct_3'
);

INSERT INTO role_history VALUES (
    'sta_3', '08-oct-2021', NULL, 'role_1', NULL, 'conct_7'
);

INSERT INTO role_history VALUES (
    'sta_4', '08-oct-2020', '08-oct-2021', 'role_1', 'contract ends', 'conct_4'
);

INSERT INTO role_history VALUES (
    'sta_4', '08-oct-2021', NULL, 'role_1', NULL, 'conct_5'
);

INSERT INTO role_history VALUES (
    'sta_5', '08-oct-2019', NULL, 'role_1', NULL, 'conct_6'
);

INSERT INTO role_history VALUES (
    'sta_6', '08-oct-2015', '08-oct-2021', 'role_1', 'promotion', 'conct_7'
);

INSERT INTO role_history VALUES (
    'sta_6', '08-oct-2021', NULL, 'role_3', NULL, 'conct_7'
);

COMMIT;

-- Evidence of Sample data
SELECT table_name FROM user_tables;

SELECT * FROM category;

SELECT * FROM location;

SELECT * FROM road;

SELECT * FROM role;

SELECT * FROM project;

SELECT * FROM project_road;

SELECT * FROM staff;

SELECT * FROM role_history;

SELECT * FROM contractor;

SELECT * FROM contract;