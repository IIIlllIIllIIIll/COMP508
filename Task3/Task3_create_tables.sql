DROP TABLE category CASCADE CONSTRAINTS;

DROP TABLE location CASCADE CONSTRAINTS;

DROP TABLE road CASCADE CONSTRAINTS;

DROP TABLE role CASCADE CONSTRAINTS;

DROP TABLE project CASCADE CONSTRAINTS;

DROP TABLE project_road CASCADE CONSTRAINTS;

DROP TABLE staff CASCADE CONSTRAINTS;

DROP TABLE contractor CASCADE CONSTRAINTS;

DROP TABLE contract CASCADE CONSTRAINTS;

DROP TABLE role_history CASCADE CONSTRAINTS;

CREATE TABLE category (
    category_id VARCHAR2(16),
    description VARCHAR2(64)
        CONSTRAINT category_description_nn NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY ( category_id ),
    CONSTRAINT category_description_uk UNIQUE ( description )
);

CREATE TABLE location (
    location_id VARCHAR2(16),
    name        VARCHAR2(64),
    latitude    NUMBER
        CONSTRAINT location_latitude_nn NOT NULL,
    longitude   NUMBER
        CONSTRAINT location_longitude_nn NOT NULL,
    description VARCHAR2(64),
    CONSTRAINT location_pk PRIMARY KEY ( location_id ),
    CONSTRAINT location_latitude_longitude_uk UNIQUE ( latitude,
                                                       longitude )
);

CREATE TABLE road (
    road_id        VARCHAR2(16),
    road_name      VARCHAR2(64)
        CONSTRAINT road_name_nn NOT NULL,
    description    VARCHAR2(64),
    category_id    VARCHAR2(16)
        CONSTRAINT road_category_id_nn NOT NULL,
    section_of     VARCHAR2(16),
    length         NUMBER(8)
        CONSTRAINT road_length_nn NOT NULL,
    start_location VARCHAR2(16)
        CONSTRAINT road_start_location_nn NOT NULL,
    end_location   VARCHAR2(16)
        CONSTRAINT road_end_location_nn NOT NULL,
    CONSTRAINT road_pk PRIMARY KEY ( road_id ),
    CONSTRAINT road_category_id_fk FOREIGN KEY ( category_id )
        REFERENCES category ( category_id ),
    CONSTRAINT road_section_of_fk FOREIGN KEY ( section_of )
        REFERENCES road ( road_id ),
    CONSTRAINT road_start_location_fk FOREIGN KEY ( start_location )
        REFERENCES location ( location_id ),
    CONSTRAINT road_end_location_fk FOREIGN KEY ( end_location )
        REFERENCES location ( location_id )
);

CREATE TABLE role (
    role_id     VARCHAR2(16),
    role_title  VARCHAR2(64)
        CONSTRAINT role_title_nn NOT NULL,
    description VARCHAR2(64),
    CONSTRAINT role_pk PRIMARY KEY ( role_id ),
    CONSTRAINT role_title_uk UNIQUE ( role_title )
);

CREATE TABLE project (
    project_id     VARCHAR2(16),
    name           VARCHAR2(64)
        CONSTRAINT project_name_nn NOT NULL,
    description    VARCHAR2(64),
    date_started   DATE
        CONSTRAINT project_date_started_nn NOT NULL,
    date_completed DATE,
    CONSTRAINT project_pk PRIMARY KEY ( project_id )
);

CREATE TABLE project_road (
    project_id VARCHAR2(16),
    road_id    VARCHAR2(16),
    CONSTRAINT project_road_pk PRIMARY KEY ( project_id,
                                             road_id ),
    CONSTRAINT project_road_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES project ( project_id ),
    CONSTRAINT project_road_road_id_fk FOREIGN KEY ( road_id )
        REFERENCES road ( road_id )
);

CREATE TABLE staff (
    staff_id       VARCHAR2(16),
    first_name     VARCHAR2(16)
        CONSTRAINT staff_first_name_nn NOT NULL,
    last_name      VARCHAR2(16)
        CONSTRAINT staff_last_name_nn NOT NULL,
    hire_date      DATE
        CONSTRAINT staff_hire_date_nn NOT NULL,
    birth_date     DATE
        CONSTRAINT staff_birth_date_nn NOT NULL,
    gender         VARCHAR2(14) DEFAULT 'not known'
        CONSTRAINT staff_gender_nn NOT NULL,
    street_address VARCHAR2(32),
    suburb         VARCHAR2(20),
    city           VARCHAR2(20),
    country        VARCHAR2(20),
    postal_code    VARCHAR2(6),
    phone_number   VARCHAR2(16),
    email          VARCHAR2(30),
    CONSTRAINT staff_pk PRIMARY KEY ( staff_id )
);

CREATE TABLE contractor (
    contractor_id  VARCHAR2(16),
    name           VARCHAR2(64)
        CONSTRAINT contractor_name_nn NOT NULL,
    street_address VARCHAR2(32),
    suburb         VARCHAR2(20),
    city           VARCHAR2(20),
    country        VARCHAR2(20),
    postal_code    VARCHAR2(6),
    phone_number   VARCHAR2(16),
    email          VARCHAR2(30),
    CONSTRAINT contractor_pk PRIMARY KEY ( contractor_id )
);

CREATE TABLE contract (
    contract_number VARCHAR2(16),
    contractor_id   VARCHAR2(16)
        CONSTRAINT contract_contractor_id_nn NOT NULL,
    project_id      VARCHAR2(16)
        CONSTRAINT contract_project_id_nn NOT NULL,
    manager_id      VARCHAR2(16)
        CONSTRAINT contract_manager_id_nn NOT NULL,
    name            VARCHAR2(64)
        CONSTRAINT contract_name_nn NOT NULL,
    description     VARCHAR2(64),
    estimated_cost  NUMBER(16)
        CONSTRAINT contract_estimated_cost_nn NOT NULL,
    actual_cost     NUMBER(16),
    start_date      DATE
        CONSTRAINT contract_start_date_nn NOT NULL,
    end_date        DATE,
    CONSTRAINT contract_pk PRIMARY KEY ( contract_number ),
    CONSTRAINT contract_contractor_id_fk FOREIGN KEY ( contractor_id )
        REFERENCES contractor ( contractor_id ),
    CONSTRAINT contract_manager_id_fk FOREIGN KEY ( manager_id )
        REFERENCES staff ( staff_id ),
    CONSTRAINT contract_project_id_fk FOREIGN KEY ( project_id )
        REFERENCES project ( project_id )
);

CREATE TABLE role_history (
    staff_id        VARCHAR2(16),
    start_date      DATE,
    end_date        DATE,
    role_id         VARCHAR2(16)
        CONSTRAINT role_history_role_id_nn NOT NULL,
    description     VARCHAR2(16),
    contract_number VARCHAR2(16),
    CONSTRAINT role_history_pk PRIMARY KEY ( staff_id,
                                             start_date ),
    CONSTRAINT role_history_staff_id_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id ),
    CONSTRAINT role_history_role_id_fk FOREIGN KEY ( role_id )
        REFERENCES role ( role_id ),
    CONSTRAINT role_history_contract_number_fk FOREIGN KEY ( contract_number )
        REFERENCES contract ( contract_number )
);